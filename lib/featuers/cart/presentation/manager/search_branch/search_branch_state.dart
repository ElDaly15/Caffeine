part of 'search_branch_cubit.dart';

@immutable
sealed class SearchBranchState {}

final class SearchBranchInitial extends SearchBranchState {}

final class SearchBranchLoading extends SearchBranchState {}

final class SearchBranchSuccess extends SearchBranchState {
  final List<BranchModel> branchesList;

  SearchBranchSuccess({required this.branchesList});
}

final class SearchBranchFailuer extends SearchBranchState {
  final String msg;

  SearchBranchFailuer({required this.msg});
}
