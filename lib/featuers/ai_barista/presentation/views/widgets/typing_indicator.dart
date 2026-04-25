import 'package:caffeine/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.mainColorTheme,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text('☕', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.whiteColorSecond,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(18),
              ),
              border:
                  Border.all(color: AppColors.secondaryColorTheme, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (i) => _Dot(index: i, ctrl: _controller)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.index, required this.ctrl});
  final int index;
  final AnimationController ctrl;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ctrl,
      builder: (context, _) {
        final phase = (ctrl.value * 3) - index;
        final scale = (phase > 0 && phase < 1) ? 0.6 + (0.4 * phase) : 0.6;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.mainColorTheme,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
