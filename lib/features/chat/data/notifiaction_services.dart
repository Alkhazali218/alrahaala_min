// import 'package:alrahaala/core/utils/helper/api.dart';
// import 'package:alrahaala/core/utils/model/notifications/notification_model.dart';

// class NotificationServices {
//   Future<messageModel> sendnotifiactions(
//       {required String token,
//       required String title,
//       required String body}) async {
//     Map<String, dynamic> data = await Api().post(
//       url: 'https://fcm.googleapis.com/v1/projects/alrahaala-f36e1/messages:send',
//       body: {
//         'message': {
//           'token': token,
//           'notification': {
//             'body': body,
//             'title': title,
//           },
//         },
//       },
//       token: token,
//     );
//     return messageModel.fromJson(data);
//   }
// }
