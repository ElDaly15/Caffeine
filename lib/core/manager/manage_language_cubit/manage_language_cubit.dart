// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'manage_language_state.dart';

class ManageLanguageCubit extends Cubit<ManageLanguageState> {
  ManageLanguageCubit() : super(const ManageLanguageInitial(Locale('en')));

  Future<void> loadSavedLanguage() async {
    final String savedLang = CacheHelper().getDataString(key: 'lang') ?? 'en';

    emit(ManageLanguageChanged(Locale(savedLang)));
  }

  Future<void> changeLanguage(String langCode) async {
    emit(ManageLanguageChanged(Locale(langCode))); // Update UI immediately

    await CacheHelper().saveData(key: 'lang', value: langCode);
  }
}
