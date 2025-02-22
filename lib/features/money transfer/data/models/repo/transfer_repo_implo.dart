import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/models/repo/transfer_repo.dart';
import 'package:alrahaala/features/money%20transfer/data/models/transfer_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TransferRepoImplo implements TransferRepo {
  ApiServer apiServer;
  TransferRepoImplo(this.apiServer);

  @override
  Future<Either<serverFailures, TransferModel>> featchTransfer(
      {required String accCode}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'exchange/account',
        data: {
          "AccCode": accCode,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(TransferModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
