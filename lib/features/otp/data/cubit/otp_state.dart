part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {}

final class OtpSucces extends OtpState {}

final class OtpFaliures extends OtpState {
  final String message;

  OtpFaliures({required this.message});
}
