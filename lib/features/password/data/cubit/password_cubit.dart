import 'package:alrahaala/features/password/data/model/repo/password_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit(this.passwordRepo) : super(PasswordInitial());
  PasswordRepo passwordRepo;

  Future<void> featchPassword({required String phone, required String password,required String deviceId}) async {
    emit(PasswordLoading());
    var result = await passwordRepo.feachPassword(phone: phone, password: password, deviceId: deviceId);

    result.fold((faliures){
      emit(PasswordFaliures(message: faliures.errorMessage));
    }, (success){
      emit(PasswordSuccess());
    });
  }
}
