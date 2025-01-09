import 'package:alrahaala/core/Notification/notification_messages.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/routes.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/cubit/Auth%20cubit/Auth_cubit.dart';
import 'package:alrahaala/cubit/chat%20cubit/chat_cubit.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
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
  NotificationMessages.requestPermission();

  await CacheNetWork.cacheInitialization();

  bool isFirstLaunch = await CacheNetWork.checkFirstLaunch();

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: kprimaryColor),
          routes: routes,
          initialRoute: isFirstLaunch ? splashView.id : loginView.id),
    );
  }
}
