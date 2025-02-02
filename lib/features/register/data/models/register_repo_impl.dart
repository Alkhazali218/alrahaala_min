import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/features/register/data/models/register_model.dart';
import 'package:alrahaala/features/register/data/models/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterRepoImpl extends RegisterRepo {
  ApiServer apiServer;
  RegisterRepoImpl(this.apiServer);

  @override
  Future<Either<Failures,RegisterModel>>featchRegister({
    required String userName,
    required String number,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      var data = await apiServer.post(
        url: 'https://exchange.rhalla.online/api/register',
        data: {
          'name': userName,
          'phone_number': number,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
        headers: {'Accept': 'application/json'},
      );
      return right(RegisterModel.fromJson(data));
    } on Exception catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
