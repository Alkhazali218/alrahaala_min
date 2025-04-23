import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/repo/transfer_account_list_repo.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/transfer_account_list_models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TransferAccountListRepoImplo implements TransferAccountListRepo {
  ApiServer apiServer;
  TransferAccountListRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, TransferAccountListModels>>
      fetchTransferAccountList() async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');

    try {
      var data = await apiServer.post(
        endPoint: 'list/user/trans',
        data: {},
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(TransferAccountListModels.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
