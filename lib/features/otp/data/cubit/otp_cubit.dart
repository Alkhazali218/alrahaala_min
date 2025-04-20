import 'package:alrahaala/features/otp/data/model/repo/otp_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.otpRepo) : super(OtpInitial());
  final OtpRepo otpRepo;

  Future<void> featchOtp(
      {required String phone, required String message}) async {
    emit(OtpLoading());

    var result = await otpRepo.featchOtp(
      phone: phone,
      message: message,
      xToken: '055151sdsdsds445sdd45sd',
    );

    result.fold((failure) {
      emit(OtpFaliures(message: failure.errorMessage));
    }, (success) {
      emit(OtpSuccess());
    });
  }
}
