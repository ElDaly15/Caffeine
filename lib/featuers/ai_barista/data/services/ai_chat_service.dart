import 'package:caffeine/core/utils/consts.dart';
import 'package:caffeine/featuers/ai_barista/data/ai_barista_constants.dart';
import 'package:caffeine/featuers/ai_barista/data/models/chat_message_model.dart';
import 'package:dio/dio.dart';

/// Service that talks to Groq's OpenAI-compatible chat completions endpoint.
/// Free tier — no billing required. Sign up at https://console.groq.com/keys
class AiChatService {
  AiChatService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: AiBaristaConstants.baseUrl,
              connectTimeout: const Duration(seconds: 20),
              receiveTimeout: const Duration(seconds: 30),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${Consts.groqApiKey}',
              },
            ));

  final Dio _dio;

  /// Send a chat completion. [history] should NOT include the new [userMessage].
  /// Returns the assistant's reply text (trimmed).
  Future<String> sendMessage({
    required List<ChatMessage> history,
    required String userMessage,
  }) async {
    final payloadMessages = <Map<String, String>>[
      {'role': 'system', 'content': AiBaristaConstants.systemPrompt},
      ...history.map((m) => {
            'role': m.isUser ? 'user' : 'assistant',
            'content': m.text,
          }),
      {'role': 'user', 'content': userMessage},
    ];

    final response = await _dio.post(
      AiBaristaConstants.chatCompletionsPath,
      data: {
        'model': AiBaristaConstants.modelName,
        'messages': payloadMessages,
        'temperature': 0.8,
        'max_tokens': 512,
      },
    );

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const FormatException('Unexpected response shape from Groq.');
    }
    final choices = data['choices'];
    if (choices is! List || choices.isEmpty) {
      throw const FormatException('No choices returned by the model.');
    }
    final message = (choices.first as Map)['message'];
    final content = message is Map ? message['content'] : null;
    if (content is! String) {
      throw const FormatException('Empty assistant reply.');
    }
    return content.trim();
  }
}
