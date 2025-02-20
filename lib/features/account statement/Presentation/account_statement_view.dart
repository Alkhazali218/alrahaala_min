import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/account_statement_view_body.dart';
import 'package:alrahaala/features/account%20statement/data/cubit/statement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountStatementView extends StatefulWidget {
  const AccountStatementView({super.key});
  static String id = 'AccountStatementView';

  @override
  State<AccountStatementView> createState() => _AccountStatementViewState();
}

class _AccountStatementViewState extends State<AccountStatementView> {
   @override
  void initState() {
    super.initState();
    BlocProvider.of<StatementCubit>(context).getStatment();
  }
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
      body: AccountStatementViewBody(),
    );
  }
}
