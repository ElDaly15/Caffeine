import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/manager/manage_language_cubit/manage_language_cubit.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/settings_section/data/models/language_item_model.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/custom_language_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanaguageViewBody extends StatefulWidget {
  const SelectLanaguageViewBody({super.key});

  @override
  State<SelectLanaguageViewBody> createState() =>
      _SelectLanaguageViewBodyState();
}

class _SelectLanaguageViewBodyState extends State<SelectLanaguageViewBody> {
  List<LanguageItemModel> languageItemModel = [
    LanguageItemModel(
      title: 'English',
      languageCode: 'en',
      image: Assets.imagesEn,
    ),
    LanguageItemModel(
      title: 'Arabic',
      languageCode: 'ar',
      image: Assets.imagesAr,
    ),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(),
          ),
          CustomHeaderWithTitleAndBackBtm(
              title: 'Select Language', color: Colors.black),
          SizedBox(
            height: 15,
          ),
          CustomLanguageListTile(
              languageItemModel: languageItemModel[0],
              isChecked: CacheHelper().getDataString(key: 'lang') == 'en',
              onChanged: () {
                BlocProvider.of<ManageLanguageCubit>(context)
                    .changeLanguage('en');
                setState(() {
                  index = 0;
                });
              }),
          SizedBox(
            height: 15,
          ),
          CustomLanguageListTile(
              languageItemModel: languageItemModel[1],
              isChecked: CacheHelper().getDataString(key: 'lang') == 'ar',
              onChanged: () {
                BlocProvider.of<ManageLanguageCubit>(context)
                    .changeLanguage('ar');
                setState(() {
                  index = 1;
                });
              }),
        ],
      ),
    );
  }
}
