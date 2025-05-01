import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/white/models/repo/white_repo.dart';
import 'package:alrahaala/features/money%20transfer/data/white/models/white_models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WhiteRepoImplo implements WhiteRepo {
  ApiServer apiServer;
  WhiteRepoImplo(this.apiServer);

  @override
  Future<Either<serverFailures, WhiteModels>> featchTransfer(
      {required String accId, required String accIdTo}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: "add/user/trans",
        data: {
          "acc_id": accId,
          "acc_to": accIdTo,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(WhiteModels.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
