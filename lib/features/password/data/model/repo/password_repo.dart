import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/password/data/model/password_model.dart';
import 'package:dartz/dartz.dart';

abstract class PasswordRepo {
  Future<Either<serverFailures,PasswordModel>> feachPassword({required String phone,required String password,required String deviceId});
}