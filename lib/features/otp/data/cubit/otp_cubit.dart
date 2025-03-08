import 'package:alrahaala/features/otp/data/model/repo/otp_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.otpRepo) : super(OtpInitial());
  OtpRepo otpRepo;
  Future<void> featchOtp(
      {required String phone, required String message}) async {
        emit(OtpLoading());
    var reslut = await otpRepo.featchOtp(
      phone: phone,
      message: message,
      xToken: '055151sdsdsds445sdd45sd',
    );
    reslut.fold(
      (faliures) {
        emit(OtpFaliures(message: faliures.errorMessage));
      },
      (success) {
        emit(OtpSucces());
      },
    );
  }
}
