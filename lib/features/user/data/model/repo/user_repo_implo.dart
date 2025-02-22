import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/user/data/model/repo/user_repo.dart';
import 'package:alrahaala/features/user/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepoImplo implements UserRepo {
  ApiServer apiServer;

  UserRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, UserModel>> featchUser(
      {required String countryID}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'current/balance/local/currency',
        data: {
          'currency_id': countryID,
        },
        headers: {
          'Authorization': 'bearer $token',
        },
      );
      return right(UserModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
