import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        backgroundColor: AppColors.mainColorTheme.withOpacity(0.3),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.mainColorTheme,
              child: IconButton(
                alignment: Alignment.center,
                icon: const Icon(IconlyLight.arrow_left_2),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        title: TextField(
          focusNode: focusNode,
          onChanged: (value) {},
          cursorColor: AppColors.mainColorTheme,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: 'Search Coffee',
            hintStyle: TextStyles.font20Medium(context)
                .copyWith(color: AppColors.darkTheme),
          ),
        ),
      ),
      body: const SearchViewBody(),
    );
  }
}
