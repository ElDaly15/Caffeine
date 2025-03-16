part of 'manage_note_cubit.dart';

@immutable
sealed class ManageNoteState {}

final class ManageNoteInitial extends ManageNoteState {}

final class ManageNoteAddOrUpdateSuccess extends ManageNoteState {}

final class ManageNoteAddOrUpdateLoading extends ManageNoteState {}

final class ManageNoteAddOrUpdateFailuer extends ManageNoteState {}
