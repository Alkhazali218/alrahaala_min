import 'package:alrahaala/core/utils/helper/api.dart';
import 'package:alrahaala/features/account%20statement/data/model/repo/statement_repo_implo.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/repo/deposit_repo_implo.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/repo/forgien_repo_implo.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo_implo.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/repo/get_transfer_repo_implo.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/model/repo/transfer_account_repo_implo.dart';
import 'package:alrahaala/features/money%20transfer/data/models/repo/transfer_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/models/country_model/repo/country_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/models/insert/repo/insert_repo_implo.dart';
import 'package:alrahaala/features/next%20ex/data/models/service_model/repo/service_repo_implo.dart';
import 'package:alrahaala/features/next/data/data/repo/next_repo_implo.dart';
import 'package:alrahaala/features/next/data/model/repo/city_repo_implo.dart';
import 'package:alrahaala/features/otp/data/model/repo/otp_repo_implo.dart';
import 'package:alrahaala/features/password/data/model/repo/password_repo_implo.dart';
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
   getIt.registerSingleton<ServiceRepoImplo>(
    ServiceRepoImplo(
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
  getIt.registerSingleton<DepositRepoImplo>(
    DepositRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<TransferRepoImplo>(
    TransferRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<StatementRepoImplo>(
    StatementRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
   getIt.registerSingleton<GetTransferRepoImplo>(
    GetTransferRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
   getIt.registerSingleton<NextRepoImplo>(
    NextRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
   getIt.registerSingleton<TransferAccountRepoImplo>(
    TransferAccountRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<PasswordRepoImplo>(
    PasswordRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<InsertRepoImplo>(
    InsertRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<OtpRepoImplo>(
    OtpRepoImplo(
      getIt.get<ApiServer>(),
    ),
  );
}
