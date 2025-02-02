import 'package:alrahaala/features/register/data/models/register_repo.dart';
import 'package:bloc/bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  Future<void> userRegister(
      {required String userName,
      required String number,
      required String password,
      required String passwordConfirmation}) async {
    emit(RegisterLoading());
    var result = await registerRepo.featchRegister(
      userName: userName,
      number: number,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (faliures) {
        emit(RegisterFaliures(message: faliures.errorMessage));
      },
      (_) {
        emit(RegisterSuccess());
      },
    );
  }
}
