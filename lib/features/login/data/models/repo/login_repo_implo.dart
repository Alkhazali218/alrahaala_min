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
  Future<Either<Failures, LoginModel>> featchLogin(
      {required String phone,
      required String password,
      required String deviceId}) async {
    try {
      var data = await apiServer.post(
        endPoint: 'login',
        data: {
          'phone': phone,
          'password': password,
          'device_id': deviceId,
        },
        headers: {'Accept': 'application/json'},
      );
      return right(LoginModel.fromJson(data));
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
