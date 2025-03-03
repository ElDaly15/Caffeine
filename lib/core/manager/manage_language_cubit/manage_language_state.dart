part of 'manage_language_cubit.dart';

@immutable
sealed class ManageLanguageState {
  final Locale locale;

  const ManageLanguageState(this.locale);
}

final class ManageLanguageInitial extends ManageLanguageState {
  const ManageLanguageInitial(super.locale);
}

final class ManageLanguageChanged extends ManageLanguageState {
  const ManageLanguageChanged(super.locale);
}
