import 'package:alrahaala/core/Notification/init%20Notifications/init_Notification.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/routes.dart';
import 'package:alrahaala/core/utils/helper/server_local.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/account%20statement/data/cubit/statement_cubit.dart';
import 'package:alrahaala/features/account%20statement/data/model/repo/statement_repo_implo.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/foreign%20exchange/data/cubit/forgien_cubit.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/cubit/deposit_cubit.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/repo/deposit_repo_implo.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/repo/forgien_repo_implo.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/login/data/cubit/login_cubit.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo_implo.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/repo/get_transfer_repo_implo.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/cubit/transfer_account_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/model/repo/transfer_account_repo_implo.dart';
import 'package:alrahaala/features/money%20transfer/data/models/repo/transfer_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/country/country_cubit.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/insert/cubit/insert_cubit.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/service/service_cubit.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/repo/country_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/models/insert/repo/insert_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/repo/service_repo_implo.dart';
import 'package:alrahaala/features/next/data/cubit/city_cubit.dart';
import 'package:alrahaala/features/next/data/data/cubit/next_cubit.dart';
import 'package:alrahaala/features/next/data/data/repo/next_repo_implo.dart';
import 'package:alrahaala/features/next/data/model/repo/city_repo_implo.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
import 'package:alrahaala/features/otp/data/model/repo/otp_repo_implo.dart';
import 'package:alrahaala/features/password/data/cubit/password_cubit.dart';
import 'package:alrahaala/features/password/data/model/repo/password_repo_implo.dart';
import 'package:alrahaala/features/register/data/cubit/register_cubit.dart';
import 'package:alrahaala/features/register/data/models/register_repo_impl.dart';
import 'package:alrahaala/features/splash/Presentation/splash_view.dart';
import 'package:alrahaala/features/user%20chat/data/cubit/cubit/user_chat_cubit.dart';
import 'package:alrahaala/features/user/data/cubit/user_cubit.dart';
import 'package:alrahaala/features/user/data/model/repo/user_repo_implo.dart';
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
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => UserChatCubit()),
        //Auth application
        BlocProvider(
            create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>())),
        BlocProvider(
            create: (context) => LoginCubit(getIt.get<LoginRepoImplo>())),
        BlocProvider(
            create: (context) => CountryCubit(getIt.get<CountryRepoImplo>())),
        BlocProvider(
            create: (context) => ServiceCubit(getIt.get<ServiceRepoImplo>())),
        BlocProvider(
            create: (context) => CityCubit(getIt.get<CityRepoImplo>())),
        BlocProvider(
            create: (context) => ForgienCubit(getIt.get<ForgienRepoImplo>())),
        BlocProvider(
            create: (context) => UserCubit(getIt.get<UserRepoImplo>())),
        BlocProvider(
            create: (context) => DepositCubit(getIt.get<DepositRepoImplo>())),

        BlocProvider(
            create: (context) =>
                StatementCubit(getIt.get<StatementRepoImplo>())),
        BlocProvider(
            create: (context) =>
                GetTransferCubit(getIt.get<GetTransferRepoImplo>())
                  ..getTransfer()),
        BlocProvider(
            create: (context) => NextCubit(getIt.get<NextRepoImplo>())),
        BlocProvider(
            create: (context) => TransferCubit(getIt.get<TransferRepoImplo>())),
        BlocProvider(
            create: (context) =>
                TransferAccountCubit(getIt.get<TransferAccountRepoImplo>())),
        BlocProvider(
            create: (context) => PasswordCubit(getIt.get<PasswordRepoImplo>())),
        BlocProvider(
            create: (context) => InsertCubit(getIt.get<InsertRepoImplo>())),
        BlocProvider(create: (context) => OtpCubit(getIt.get<OtpRepoImplo>())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: kprimaryColor),
          routes: routes,
          initialRoute: isFirstLaunch ? splashView.id : loginView.id),
    );
  }
}
