import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo_implo.dart';
import 'package:alrahaala/features/register/data/models/register_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void gettItSetup() {
  getIt.registerSingleton<ApiServer>(ApiServer(Dio()));
  getIt.registerSingleton<LoginRepoImplo>(
    LoginRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
}
