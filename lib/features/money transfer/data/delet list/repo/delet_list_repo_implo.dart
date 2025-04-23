import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/delet%20list/model/delet_list_model.dart';
import 'package:alrahaala/features/money%20transfer/data/delet%20list/repo/delet_list_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DeletListRepoImplo implements DeletListRepo {
  ApiServer apiServer;
  DeletListRepoImplo(this.apiServer);

  @override
  Future<Either<serverFailures, DeletListModel>> deletList(
      {required String id}) async {
    String? token = CacheNetWork.getCacheDaTaInfo(key: 'token');
    try {
      var data = await apiServer.post(
        endPoint: 'delete/user/trans',
        data: {
          "id": id,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return right(DeletListModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(serverFailures.fromDioError(e));
      } else {
        return left(serverFailures(errorMessage: e.toString()));
      }
    }
  }
}
