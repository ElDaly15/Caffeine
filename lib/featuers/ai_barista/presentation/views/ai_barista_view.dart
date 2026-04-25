import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/ai_barista/data/ai_barista_constants.dart';
import 'package:caffeine/featuers/ai_barista/presentation/manager/ai_chat_cubit/ai_chat_cubit.dart';
import 'package:caffeine/featuers/ai_barista/presentation/views/widgets/chat_bubble.dart';
import 'package:caffeine/featuers/ai_barista/presentation/views/widgets/chat_input.dart';
import 'package:caffeine/featuers/ai_barista/presentation/views/widgets/quick_replies_row.dart';
import 'package:caffeine/featuers/ai_barista/presentation/views/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiBaristaView extends StatelessWidget {
  const AiBaristaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AiChatCubit()..init(isArabic: isArabic()),
      child: const _AiBaristaBody(),
    );
  }
}

class _AiBaristaBody extends StatefulWidget {
  const _AiBaristaBody();

  @override
  State<_AiBaristaBody> createState() => _AiBaristaBodyState();
}

class _AiBaristaBodyState extends State<_AiBaristaBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ar = isArabic();
    final title = ar ? 'الباريستا الذكي' : 'AI Barista';
    final subtitle = ar ? 'مساعدك للقهوة' : 'Your coffee guide';
    final hint = ar ? 'اسأل الباريستا أي شيء…' : 'Ask the barista anything…';

    return Scaffold(
      backgroundColor: AppColors.whiteColorFirst,
      appBar: AppBar(
        backgroundColor: AppColors.mainColorTheme,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.secondaryColorTheme),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColorTheme,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text('☕', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyles.font18SemiBold(context)
                      .copyWith(color: AppColors.secondaryColorTheme),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      subtitle,
                      style: TextStyles.font11Regular(context).copyWith(
                          color: AppColors.secondaryColorTheme
                              .withValues(alpha: 0.85)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          BlocBuilder<AiChatCubit, AiChatState>(
            builder: (context, state) {
              return IconButton(
                tooltip: ar ? 'محادثة جديدة' : 'New chat',
                onPressed: state is AiChatTyping
                    ? null
                    : () =>
                        context.read<AiChatCubit>().clearChat(isArabic: ar),
                icon: const Icon(Icons.refresh_rounded),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<AiChatCubit, AiChatState>(
                listener: (context, state) {
                  _scrollToBottom();
                  if (state is AiChatError && state.errorMsg.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMsg),
                        backgroundColor: Colors.red.shade700,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final messages = state.messages;
                  final isTyping = state is AiChatTyping;

                  if (state is AiChatInitial) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainColorTheme,
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: messages.length + (isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (isTyping && index == messages.length) {
                        return const TypingIndicator();
                      }
                      return ChatBubble(message: messages[index]);
                    },
                  );
                },
              ),
            ),
            BlocBuilder<AiChatCubit, AiChatState>(
              builder: (context, state) {
                final showQuick =
                    state is AiChatLoaded && state.messages.length <= 1;
                if (!showQuick) return const SizedBox.shrink();
                return QuickRepliesRow(
                  suggestions: ar
                      ? AiBaristaConstants.quickRepliesAr
                      : AiBaristaConstants.quickRepliesEn,
                  onTap: (value) =>
                      context.read<AiChatCubit>().sendMessage(value),
                );
              },
            ),
            BlocBuilder<AiChatCubit, AiChatState>(
              builder: (context, state) {
                final enabled = state is! AiChatTyping;
                return ChatInput(
                  enabled: enabled,
                  hint: hint,
                  onSend: (text) =>
                      context.read<AiChatCubit>().sendMessage(text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
