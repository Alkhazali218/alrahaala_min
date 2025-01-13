
import 'package:alrahaala/core/Notification/models/notification_model.dart';
import 'package:alrahaala/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failures, NotificationModel>> fetchNotificationMessage({required String body,required String title,required String topic});
}

