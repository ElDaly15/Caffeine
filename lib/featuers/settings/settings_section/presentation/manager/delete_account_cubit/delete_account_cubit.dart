import 'package:bloc/bloc.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/featuers/auth/domain/repos/auth_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  Future<void> deleteAccount() async {
    try {
      emit(DeleteAccountLoading());
      var resultOfRepo = await getIt<AuthRepo>().deleteAccount();
      resultOfRepo.fold((l) => emit(DeleteAccountFailuer(errorMsg: l.message)),
          (r) => emit(DeleteAccountSuccess()));
    } on Exception {
      emit(DeleteAccountFailuer(
          errorMsg: 'An error occurred. Please try again.'));
    }
  }
}
