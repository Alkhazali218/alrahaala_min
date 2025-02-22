import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/next%20ex/data/models/insert/insert_model.dart';
import 'package:alrahaala/features/next%20ex/data/models/insert/repo/insert_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class InsertRepoImplo implements InsertRepo {
  ApiServer apiServer;
  InsertRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, InsertModel>> featchInsert({
    required String recievedCurrencyId,
    required String countryIdFrom,
    required String recievedBranchId,
    required String recievedName,
    required String rPhone1,
    required String cityIdTo,
    required String deliveredCurrencyId,
    required String countryIdTo,
    required String serviceType,
    required String currRecievedVal,
    required String accFrom,
    required String ownAccNo,
  }) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'external/insert/transfer',
        data: {
          "RecievedCurrencyID": recievedCurrencyId,
          "CountryIDFrom": countryIdFrom,
          "RecievedBranchID": recievedBranchId,
          "RecievedName": recievedName,
          "RPhone1": rPhone1,
          "CityIDTo": cityIdTo,
          "DeliveredCurrencyID": deliveredCurrencyId,
          "CountryIDTo": countryIdTo,
          "ServiceType": serviceType,
          "CurrRecievedVal": currRecievedVal,
          "AccFrom": accFrom,
          "OwnAccNo": ownAccNo,
        },
        headers: {
          'Authorization': 'bearer $token',
        },
      );
      return right(InsertModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
