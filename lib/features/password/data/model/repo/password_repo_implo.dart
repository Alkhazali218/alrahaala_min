import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/password/data/model/password_model.dart';
import 'package:alrahaala/features/password/data/model/repo/password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PasswordRepoImplo implements PasswordRepo {
  ApiServer apiServer;
  PasswordRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, PasswordModel>> feachPassword({
    required String phone,
    required String password,
    required String deviceId,
  }) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
  var data = await apiServer.post(
    endPoint: 'update/password',
    data: {
      "phone": phone,
      "password": password,
      "device_id": deviceId,
    },
    headers: {
      'Authorization': 'bearer $token',
    },
  );
  return right(PasswordModel.fromJson(data));
} on Exception catch (e) {
  if (e is DioError) {
    return left(serverFailures.fromDioError(e));
  } else {
    return left(serverFailures(errorMessage: e.toString()));
  }
}
  }
}
