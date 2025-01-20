import 'package:alrahaala/core/Notification/init%20Notifications/init_Notification.dart';
import 'package:alrahaala/core/Notification/models/repo/notification_impl_repo.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/routes.dart';
import 'package:alrahaala/core/utils/helper/server_local.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/login/data/cubit/login_cubit.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo_implo.dart';
import 'package:alrahaala/features/register/data/cubit/register_cubit.dart';
import 'package:alrahaala/features/splash/Presentation/splash_view.dart';
import 'package:alrahaala/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InitNotification.requestPermission();
  await CacheNetWork.cacheInitialization();
  bool isFirstLaunch = await CacheNetWork.checkFirstLaunch();
  gettItSetup();

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit(getIt.get<NotificationImplRepo>())),
        BlocProvider(create: (context) => LoginCubit(getIt.get<LoginRepoImplo>())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: kprimaryColor),
          routes: routes,
          initialRoute: isFirstLaunch ? splashView.id : loginView.id),
    );
  }
}
