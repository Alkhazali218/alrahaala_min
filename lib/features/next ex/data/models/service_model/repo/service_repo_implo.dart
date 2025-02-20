import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/repo/service_repo.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/service_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ServiceRepoImplo implements ServiceRepo {
  ApiServer apiServer;
  ServiceRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, ServiceModel>> featchService(
      {required String countryId}) async {
    String token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: "service/external/transfer",
        data: {
          'country_id': countryId,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(ServiceModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
