import 'package:alrahaala/core/Notification/models/repo/notification_impl_repo.dart';
import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void gettItSetup() {
  getIt.registerSingleton<ApiServer>(ApiServer(Dio()));
  getIt.registerSingleton<NotificationImplRepo>(
    NotificationImplRepo(
      getIt.get<ApiServer>(),
    ),
  );
}
