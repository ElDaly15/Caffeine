enum ChatRole { user, assistant }

class ChatMessage {
  final ChatRole role;
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.role,
    required this.text,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  ChatMessage copyWith({ChatRole? role, String? text, DateTime? timestamp}) {
    return ChatMessage(
      role: role ?? this.role,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  bool get isUser => role == ChatRole.user;
}
