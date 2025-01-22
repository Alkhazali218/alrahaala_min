import 'package:alrahaala/features/login/data/models/repo/login_repo.dart';
import 'package:alrahaala/features/user%20chat/data/cubit/cubit/user_chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> loginUser(
      {required String number,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoading());


    var result = await loginRepo.featchLogin(number: number, password: password);

    result.fold(
      (failure) {
        emit(LoginFaliures(message: failure.errorMessage));
      },
      (loginSuccessData) {
        var user = loginSuccessData.user;
        BlocProvider.of<UserChatCubit>(context).addUser(loginUserModel: user);

        emit(LoginSuccess());
      }
    );
  }
}

