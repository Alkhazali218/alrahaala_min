import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/features/user/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<serverFailures,UserModel>> featchUser({required String countryID});
}