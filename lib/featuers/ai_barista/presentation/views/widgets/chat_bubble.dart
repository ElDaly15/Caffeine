import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/ai_barista/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final bg = isUser ? AppColors.mainColorTheme : AppColors.whiteColorSecond;
    final textColor = isUser ? Colors.white : AppColors.darkTheme;

    final radius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: Radius.circular(isUser ? 18 : 4),
      bottomRight: Radius.circular(isUser ? 4 : 18),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _avatar(),
          if (!isUser) const SizedBox(width: 8),
          Flexible(
            child: GestureDetector(
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: message.text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copied'),
                    duration: Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: radius,
                  border: isUser
                      ? null
                      : Border.all(
                          color: AppColors.secondaryColorTheme, width: 1),
                ),
                child: SelectableText(
                  message.text,
                  style: TextStyles.font14Regular(context).copyWith(
                    color: textColor,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 8),
          if (isUser) _userDot(),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Container(
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        color: AppColors.mainColorTheme,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: const Text('☕', style: TextStyle(fontSize: 16)),
    );
  }

  Widget _userDot() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.secondaryColorTheme,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: const Icon(Icons.person, size: 18, color: AppColors.darkTheme),
    );
  }
}
