import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/register/data/models/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<Failures, RegisterModel>> featchRegister({
    required String phone,
    required String password,
    required String deviceId,
  });
}
