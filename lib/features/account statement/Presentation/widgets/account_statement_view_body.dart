import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_apect_item.dart';
import 'package:alrahaala/features/account%20statement/data/cubit/statement_cubit.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountStatementViewBody extends StatelessWidget {
  AccountStatementViewBody({super.key});
  
  List<DataStatementModel> dataList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatementCubit, StatementState>(
      builder: (context, state) {
        if (state is StatementSuccess) {
          dataList = state.statement;
          dataList.sort((a, b) => DateTime.parse(b.insertDate).compareTo(DateTime.parse(a.insertDate)));
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return CustomAspectItem(data: dataList[index]);
            },
          );
        } else if (state is StatementFaliures) {
          return Center(
            child: Text(
              state.message,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 28),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator(color: kpColor));
        }
      },
    );
  }
}
