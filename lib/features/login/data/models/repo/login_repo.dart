import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failures,LoginModel>> featchLogin({required String number,required String password});
}