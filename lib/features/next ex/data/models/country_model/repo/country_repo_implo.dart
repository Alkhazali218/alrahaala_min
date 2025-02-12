import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/country_model.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/repo/country_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CountryRepoImplo implements CountryRepo {
  ApiServer apiServer;
  CountryRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, CountryModel>> featchCountry(
      {required String countryId}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'countries',
        data: {
          'country_id': countryId,
        },
        headers: {
          'Authorization': 'bearer $token',
        },
      );
      return right(CountryModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
