import 'package:alrahaala/features/register/data/models/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  Future<void> userRegister(
      {required String phone,
      required String password,
      required String deviceId}) async {
    emit(RegisterLoading());
    var result = await registerRepo.featchRegister(
        phone: phone, password: password, deviceId: deviceId);
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
