import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next/data/data/model/next_model/next_model.dart';
import 'package:alrahaala/features/next/data/data/repo/next_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NextRepoImplo implements NextRepo {
  ApiServer apiServer;

  NextRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, NextModel>> featchNext({
    required String countryId,
    required String revicedPhone,
    required String revicedName,
    required String accID,
    required String branchId,
    required String amount,
    required String cityId,
    required String currencyId,
  }) async {
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'internal/exchange',
        data: {
          "country_id": countryId,
          "reviced_phone": revicedPhone,
          "reviced_name": revicedName,
          "AccID": accID,
          "branch_id": branchId,
          "amount": amount,
          "city_id": cityId,
          "currency_id": countryId,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(NextModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
