import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/model/repo/transfer_account_repo.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/model/transAccount_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TransferAccountRepoImplo implements TransferAccountRepo {
  ApiServer apiServer;
  TransferAccountRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, TransaccountModel>> featchTransferAccount({
    required String accId,
    required String currencyId,
    required String accIdTo,
    required String amount,
    required String branchId,
  }) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'internal/trans/between/accounts',
        data: {
          "acc_id": accId,
          "acc_id_to": accIdTo,
          "currency_id": currencyId,
          "amount": amount,
          "branch_id": branchId,
        },
        headers: {
          'Authorization': 'bearer $token',
        },
      );
      return right(TransaccountModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
