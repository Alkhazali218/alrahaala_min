import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_money_transfer.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewTransferItem extends StatelessWidget {
  CustomListViewTransferItem({super.key});
  List<DataGetTransferModel> dataList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTransferCubit, GetTransferState>(
      builder: (context, state) {
        if (state is GetTransferSuccess) {
          dataList = state.getTransfer;
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return CustomMoneyTransfer(data: dataList[index]);
            },
          );
        } else if (state is GetTransferFaliures) {
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
