import 'package:alrahaala/features/login/data/models/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> loginUser(
      {required String number, required String password}) async {
    emit(LoginLoading());
    var reslut =
        await loginRepo.featchLogin(number: number, password: password);
    reslut.fold(
      (failure) {
        emit(LoginFaliures(message: failure.errorMessage));
      },
      (_) {
        emit(LoginSuccess());
      },
    );
  }
}
