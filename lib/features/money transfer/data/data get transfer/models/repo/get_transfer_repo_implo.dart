import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/repo/get_transfer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GetTransferRepoImplo implements GetTransferRepo {
  ApiServer apiServer;
  GetTransferRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, GetTransferModel>> featchGetTransfer() async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
  var data = await apiServer.get(
    endPoint: 'exchange/accounts/data',
    headers: {
        'Authorization': 'bearer $token',
      },
  );
  return right(GetTransferModel.fromJson(data));
} on Exception catch (e) {
  if (e is DioException) {
    return left(serverFailures.fromDioError(e));
  } else {
    return left(serverFailures(errorMessage: e.toString()));
  }
}
  }
}
