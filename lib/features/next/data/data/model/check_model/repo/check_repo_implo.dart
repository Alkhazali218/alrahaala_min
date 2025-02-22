import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next/data/data/model/check_model/check_model.dart';
import 'package:alrahaala/features/next/data/data/model/check_model/repo/check_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CheckRepoImplo implements CheckRepo {
  ApiServer apiServer;

  CheckRepoImplo(this.apiServer);

  @override
  Future<Either<serverFailures, CheckModel>> featchCheck({
    required String accId,
    required String amount,
    required String period,  // إضافة period هنا
  }) async {
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'internal/exchange/limit/check',
        data: {
          "acc_id": accId,
          "amount": amount,
          "period": period,  // إرسال period هنا
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(CheckModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}

