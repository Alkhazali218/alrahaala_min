import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/account_statement_view_body.dart';
import 'package:flutter/material.dart';

class AccountStatementView extends StatelessWidget {
  const AccountStatementView({super.key});
  static String id = 'AccountStatementView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'كشف الحساب',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const AccountStatementViewBody(),
    );
  }
}
