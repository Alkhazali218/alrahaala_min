import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/otp/data/model/otp_model.dart';
import 'package:dartz/dartz.dart';

abstract class OtpRepo {
  Future<Either<serverFailures,OtpModel>> featchOtp({required String phone, required String message, required String xToken});
}