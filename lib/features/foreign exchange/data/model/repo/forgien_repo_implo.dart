import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/forgien_model.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/repo/forgien_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ForgienRepoImplo implements ForgienRepo {
  ApiServer apiServer;
  ForgienRepoImplo(this.apiServer);

  @override
  Future<Either<serverFailures, ForgienModel>> featchForgien() async {
    String countryID = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'forgien/exchange/deposit/balance',
        data: {
          'currency_id': countryID,
        },
        headers: {
          'Authorization': 'bearer $token',
        },
      );
      return right(ForgienModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
    
  }
}
