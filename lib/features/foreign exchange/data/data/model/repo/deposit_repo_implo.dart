import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/repo/deposit_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DepositRepoImplo implements DepositRepo {
  ApiServer apiServer;
  DepositRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, DepositModel>> featchDeposit(
      {required String currencyId}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
  var data = await apiServer.post(
    endPoint: 'forgien/exchange/deposit/account/statement',
    data: {
      "currency_id": currencyId,
    },
    headers: {
      'Authorization' : 'Bearer $token',
    },
  );
  return right(DepositModel.fromJson(data));
} on Exception catch (e) {
  if (e is DioError) {
    return left(serverFailures.fromDioError(e));
  } else {
    return left(serverFailures(errorMessage: e.toString()));
  }
}
  }
}
