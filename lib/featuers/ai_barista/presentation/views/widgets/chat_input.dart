import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({
    super.key,
    required this.enabled,
    required this.onSend,
    required this.hint,
  });

  final bool enabled;
  final void Function(String text) onSend;
  final String hint;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasText = _controller.text.trim().isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty || !widget.enabled) return;
    widget.onSend(text);
    _controller.clear();
    setState(() => _hasText = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: AppColors.secondaryColorTheme, width: 1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 120),
                decoration: BoxDecoration(
                  color: AppColors.whiteColorSecond,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      color: AppColors.secondaryColorTheme, width: 1),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focus,
                  enabled: widget.enabled,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _send(),
                  style: TextStyles.font14Regular(context)
                      .copyWith(color: AppColors.darkTheme),
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyles.font14Regular(context)
                        .copyWith(color: Colors.black54),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            _SendButton(
              enabled: widget.enabled && _hasText,
              onTap: _send,
            ),
          ],
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.enabled, required this.onTap});
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: enabled ? 1 : 0.4,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: AppColors.mainColorTheme,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: enabled ? onTap : null,
          child: const SizedBox(
            width: 48,
            height: 48,
            child: Icon(Icons.send_rounded, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}
