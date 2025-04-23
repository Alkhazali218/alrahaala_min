import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_list_view_transfer_account_item.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/cubit/transfer_account_list_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/transfer_account_list_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTransferAccountsListItem extends StatelessWidget {
  CustomTransferAccountsListItem({super.key});

  List<DataTransferAccountListModels> dataList = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ': الحسابات المسموح بالتحويل لها',
                style: googleFont30.copyWith(
                  color: kcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: getRsonsiveFontSize(context, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.025),
          Expanded(child: BlocBuilder<TransferAccountListCubit, TransferAccountListState>(
            builder: (context, state) {
              if (state is TransferAccountListSucces) {
                dataList = state.data;
                return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (_, index) {
                    return CustomListViewTransferAccountItem(
                        data: dataList[index],
                        );
                  },
                );
              } else if (state is TransferAccountListFialures) {
                return Center(
                  child: Text(
                    state.message,
                    style: googleFont30.copyWith(
                      color: kcolor,
                      fontSize: getRsonsiveFontSize(context, fontSize: 16),
                    ),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(color: kpColor));
              }
            },
          )),
        ],
      ),
    );
  }
}
