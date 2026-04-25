import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/ai_barista/data/ai_barista_constants.dart';
import 'package:caffeine/featuers/ai_barista/data/models/chat_message_model.dart';
import 'package:caffeine/featuers/ai_barista/data/services/ai_chat_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'ai_chat_state.dart';

class AiChatCubit extends Cubit<AiChatState> {
  AiChatCubit({AiChatService? service})
      : _service = service ?? AiChatService(),
        super(const AiChatInitial());

  final AiChatService _service;
  final List<ChatMessage> messages = [];
  bool _initialized = false;

  /// Minimum delay between user messages to avoid hitting RPM limit.
  /// Groq llama-3.1-8b-instant free tier: 30 RPM → 2s between calls is safe.
  static const Duration _minSendInterval = Duration(seconds: 2);
  DateTime? _lastSentAt;

  /// Call once when entering the chat view.
  /// [isArabic] decides which welcome message is shown.
  void init({required bool isArabic}) {
    if (_initialized) {
      emit(AiChatLoaded(messages: List<ChatMessage>.from(messages)));
      return;
    }
    _initialized = true;

    messages.add(ChatMessage(
      role: ChatRole.assistant,
      text: isArabic
          ? AiBaristaConstants.welcomeAr
          : AiBaristaConstants.welcomeEn,
    ));
    emit(AiChatLoaded(messages: List<ChatMessage>.from(messages)));
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    // Client-side throttle: enforce min spacing between calls to avoid 429.
    if (_lastSentAt != null) {
      final elapsed = DateTime.now().difference(_lastSentAt!);
      if (elapsed < _minSendInterval) {
        await Future.delayed(_minSendInterval - elapsed);
      }
    }
    _lastSentAt = DateTime.now();

    // Snapshot history BEFORE adding the new user message so the service
    // doesn't duplicate it.
    final historySnapshot = List<ChatMessage>.from(messages);

    messages.add(ChatMessage(role: ChatRole.user, text: trimmed));
    emit(AiChatTyping(messages: List<ChatMessage>.from(messages)));

    try {
      final reply = await _service.sendMessage(
        history: historySnapshot,
        userMessage: trimmed,
      );
      messages.add(ChatMessage(
        role: ChatRole.assistant,
        text: reply.isEmpty
            ? "Sorry, I couldn't think of a reply. Try rephrasing ☕"
            : reply,
      ));
      emit(AiChatLoaded(messages: List<ChatMessage>.from(messages)));
    } catch (e, st) {
      debugPrint('[AiBarista] sendMessage failed: $e');
      debugPrint('[AiBarista] stacktrace: $st');
      emit(AiChatError(
        messages: List<ChatMessage>.from(messages),
        errorMsg: _friendlyError(e),
      ));
    }
  }

  /// Reset the conversation.
  void clearChat({required bool isArabic}) {
    messages.clear();
    messages.add(ChatMessage(
      role: ChatRole.assistant,
      text: isArabic
          ? AiBaristaConstants.welcomeAr
          : AiBaristaConstants.welcomeEn,
    ));
    emit(AiChatLoaded(messages: List<ChatMessage>.from(messages)));
  }

  String _friendlyError(Object e) {
    if (e is DioException) {
      final status = e.response?.statusCode;
      final body = e.response?.data;
      final apiMsg = body is Map && body['error'] is Map
          ? (body['error']['message'] as String?) ?? ''
          : '';

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return 'Connection timed out. Please try again.';
      }
      if (e.type == DioExceptionType.connectionError) {
        return 'No internet connection. Please try again.';
      }
      switch (status) {
        case 401:
          return 'Invalid Groq API key. Check Consts.groqApiKey.';
        case 403:
          return 'Access denied. Verify your Groq API key permissions.';
        case 404:
          return 'Model "${AiBaristaConstants.modelName}" not found. '
              'Try llama-3.3-70b-versatile or gemma2-9b-it.';
        case 429:
          return 'Sending too fast. Please wait ~60 seconds and try again ☕';
        case 500:
        case 502:
        case 503:
          return 'Groq is busy. Please try again in a moment.';
      }
      if (apiMsg.isNotEmpty && kDebugMode) {
        return 'Error: $apiMsg';
      }
    }
    final msg = e.toString();
    if (msg.contains('SocketException') ||
        msg.contains('Failed host lookup') ||
        msg.contains('Network is unreachable')) {
      return 'No internet connection. Please try again.';
    }
    // In debug mode, surface the real error so the developer can see it.
    if (kDebugMode) {
      return 'Error: ${msg.length > 200 ? '${msg.substring(0, 200)}…' : msg}';
    }
    return 'Something went wrong. Please try again.';
  }
}
