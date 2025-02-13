import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/repo/forgien_repo_implo.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/repo/country_repo_implo.dart';
import 'package:alrahaala/features/next/data/model/repo/city_repo_implo.dart';
import 'package:alrahaala/features/register/data/models/register_repo_impl.dart';
import 'package:alrahaala/features/user/data/model/repo/user_repo_implo.dart';
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
  getIt.registerSingleton<CountryRepoImplo>(
    CountryRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<CityRepoImplo>(
    CityRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<ForgienRepoImplo>(
    ForgienRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
   getIt.registerSingleton<UserRepoImplo>(
    UserRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
}
