import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/otp/data/model/otp_model.dart';
import 'package:alrahaala/features/otp/data/model/repo/otp_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OtpRepoImplo implements OtpRepo {
  ApiServer apiServer;
  OtpRepoImplo(this.apiServer);
  @override
  Future<Either<serverFailures, OtpModel>> featchOtp(
      {required String phone,
      required String message,
      required String xToken}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'send/whatsapp/message',
        data: {
          "phone": phone,
          "message": message,
          "xtoken": xToken,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(OtpModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
