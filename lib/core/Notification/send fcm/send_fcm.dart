import 'package:alrahaala/core/Notification/init%20Notifications/init_Notification.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:dio/dio.dart';

class SendFcm {
  // دالة إرسال الإشعارات
  static Future<void> apiFcm({
    required String body,
    required String title,
    required String token,
  }) async {
    // الحصول على الـ access token
    String? accessToken = await InitNotification.getAccessToken();

    var messageData = {
      "message": {
        "token": token,
        "notification": {
          "body": body,
          "title": title,
        },
      }
    };

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      ApiServer apiServer = ApiServer(Dio());
      var response = await apiServer.post(
        url:
            'https://fcm.googleapis.com/v1/projects/alrahaala-f36e1/messages:send',
        data: messageData,
        headers: headers,
      );

      print('Notification Response: $response');
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
