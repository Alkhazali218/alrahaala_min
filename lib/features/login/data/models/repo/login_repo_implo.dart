import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImplo implements LoginRepo {
  final ApiServer apiServer;

  LoginRepoImplo(this.apiServer);
  @override
  Future<Either<Failures,LoginModel>> featchLogin(
      {required String number, required String password}) async {
    try {
      var data = await apiServer.post(
        url: 'https://exchange.rhalla.online/api/login',
        data: {
          'phone_number': number,
          'password': password,
        },
        headers: {
          'Accept': 'application/json'
        }
      );
      return right(LoginModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(serverFailures.FromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
