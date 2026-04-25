part of 'ai_chat_cubit.dart';

@immutable
sealed class AiChatState {
  final List<ChatMessage> messages;
  const AiChatState({this.messages = const []});
}

final class AiChatInitial extends AiChatState {
  const AiChatInitial() : super(messages: const []);
}

final class AiChatLoaded extends AiChatState {
  const AiChatLoaded({required super.messages});
}

final class AiChatTyping extends AiChatState {
  const AiChatTyping({required super.messages});
}

final class AiChatError extends AiChatState {
  final String errorMsg;
  const AiChatError({required super.messages, required this.errorMsg});
}
