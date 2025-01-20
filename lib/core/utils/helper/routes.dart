import 'package:alrahaala/features/account%20statement/Presentation/account_statement_view.dart';
import 'package:alrahaala/features/chat/Presentation/chat_view.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/money_transfer_view.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/user_money_transfer.dart';
import 'package:alrahaala/features/next%20ex/Presentation/next_ex_view.dart';
import 'package:alrahaala/features/next/Presentation/next_view.dart';
import 'package:alrahaala/features/password/Presentation/password_view.dart';
import 'package:alrahaala/features/register/Presentation/register_view.dart';
import 'package:alrahaala/features/screen/Presentation/screen_view.dart';
import 'package:alrahaala/features/splash/Presentation/splash_view.dart';
import 'package:alrahaala/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:alrahaala/features/stack%20user%20star/Presentation/stack_user_view_star.dart';
import 'package:alrahaala/features/support/Presentation/support_view.dart';
import 'package:alrahaala/features/user%20chat/Presentation/user_chat.dart';
import 'package:alrahaala/features/user/Presentation/user_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  splashView.id: (context) => splashView(),
  loginView.id: (context) => const loginView(),
  registerView.id: (context) => const registerView(),
  homeView.id: (context) => const homeView(),
  passwordView.id: (context) => const passwordView(),
  userView.id: (context) => const userView(),
  supportView.id: (context) => const supportView(),
  screenView.id: (context) => const screenView(),
  StackUserViewBasic.id: (context) => const StackUserViewBasic(),
  StackUserViewStar.id: (context) => const StackUserViewStar(),
  nextView.id: (context) => const nextView(),
  NextExView.id: (context) => const NextExView(),
  AccountStatementView.id: (context) => const AccountStatementView(),
  MoneyTransferView.id: (context) => const MoneyTransferView(),
  chatView.id: (context) =>const chatView(),
  UserMoneyTransfer.id: (context) =>const UserMoneyTransfer(),
  UserChat.id: (context) =>const UserChat(),
};
