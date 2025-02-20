import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next/data/model/city_model.dart';
import 'package:alrahaala/features/next/data/model/repo/city_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CityRepoImplo implements CityRepo {
  ApiServer apiServer;

  CityRepoImplo(this.apiServer);

  @override
  Future<Either<serverFailures, CityModel>> featchCity({
    required String countryId,
    required String cityId,
  }) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'cities',
        data: {
          "country_id": countryId,
          "exclude_city_id": cityId,
        },
        headers: {
          'Authorization': 'bearer $token',
        },
      );

      return right(CityModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
