import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

class AccountStatementView extends StatelessWidget {
  const AccountStatementView({super.key});
  static String id = 'AccountStatementView';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar:AppBar(
        backgroundColor: kcolor,
      foregroundColor: kprimaryColor,
    ),
   );
  }
}