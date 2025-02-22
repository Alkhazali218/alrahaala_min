import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/account%20statement/data/model/repo/statement_repo.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StatementRepoImplo implements StatementRepo {
  ApiServer apiServer;

  StatementRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, StatementModel>> featchStatement() async {
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.get(
        endPoint: 'local/account/statment',
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(StatementModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
