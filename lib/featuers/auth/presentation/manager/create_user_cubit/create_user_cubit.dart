// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';
import 'package:caffeine/featuers/auth/domain/repos/auth_repo.dart';
import 'package:flutter/widgets.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.authRepo, this.context) : super(CreateUserInitial());
  final AuthRepo authRepo;
  final BuildContext context;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(CreateUserLoading());
    var result = await authRepo.createUserWithEmailAndPassword(
        email, password, name, context);
    result.fold(
      (failuer) => emit(CreateUserFailuer(message: failuer.message)),
      (user) => emit(CreateUserSuccess(userEntity: user)),
    );
  }
}
