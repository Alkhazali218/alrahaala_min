import 'package:alrahaala/core/utils/helper/server_local.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/login/data/cubit/login_cubit.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo_implo.dart';
import 'package:alrahaala/features/register/data/cubit/register_cubit.dart';
import 'package:alrahaala/features/user%20chat/data/cubit/cubit/user_chat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider(create: (context) => ChatCubit()),
  BlocProvider(create: (context) => LoginCubit(getIt.get<LoginRepoImplo>())),
  BlocProvider(create: (context) => RegisterCubit()),
  BlocProvider(create: (context) => UserChatCubit()),
];

