import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next/data/model/next_model.dart';
import 'package:alrahaala/features/next/data/model/repo/next_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NextRepoImplo implements NextRepo {
  ApiServer apiServer;
  NextRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, NextModel>> featchCity() async {
    String? countryId = CacheNetWork.getCacheDaTaInfo(key: 'Countires_ID');
    try {
      var data = await apiServer.get(endPoint: "cities/$countryId");
      return right(NextModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
