import 'package:alrahaala/core/Notification/init%20Notifications/init_Notification.dart';
import 'package:alrahaala/core/Notification/models/notification_model.dart';
import 'package:alrahaala/core/Notification/models/repo/notification_repo.dart';
import 'package:alrahaala/core/errors/failures.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationImplRepo implements NotificationRepo {
  final ApiServer apiServer;

  NotificationImplRepo(this.apiServer);

  @override
  Future<Either<Failures, NotificationModel>> fetchNotificationMessage(
      {required String body,
      required String title,
      required String topic}) async {
    String? accessToken = await InitNotification.getAccessToken();
    try {
      var data = await apiServer.post(
        endPoint: 'projects/alrahaala-f36e1/messages:send',
        data: {
          "message": {
            "topic": topic,
            "notification": {
              "title": title,
              "body": body,
            },
          },
        },
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      return right(NotificationModel.fromJson(data));
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(serverFailures.FromDioError(e));
      }
      return left(serverFailures(errorMessage: e.toString()));
    }
  }
}
