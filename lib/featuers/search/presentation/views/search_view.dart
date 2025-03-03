import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/search/presentation/views/widgets/search_view_body.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:iconly/iconly.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          // ignore: deprecated_member_use
          backgroundColor: AppColors.mainColorTheme.withOpacity(0.3),
          leadingWidth: 60,
          leading: Padding(
            padding: EdgeInsets.only(
                left: isArabic() ? 0 : 22, right: isArabic() ? 22 : 0),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.mainColorTheme,
              child: IconButton(
                alignment: Alignment.center,
                icon: isArabic()
                    ? const Icon(IconlyLight.arrow_right_2)
                    : const Icon(IconlyLight.arrow_left_2),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          title: TextSelectionTheme(
            data: const TextSelectionThemeData(
              cursorColor: AppColors.mainColorTheme,
              selectionColor: AppColors.mainColorTheme,
              selectionHandleColor: AppColors.mainColorTheme,
            ),
            child: TextField(
              focusNode: focusNode,
              onChanged: (value) {},
              cursorColor: AppColors.mainColorTheme,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: S.of(context).search_coffee,
                hintStyle: TextStyles.font20Medium(context)
                    .copyWith(color: AppColors.darkTheme),
              ),
              style: TextStyles.font20Medium(context)
                  .copyWith(color: AppColors.darkTheme),
            ),
          ),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}
