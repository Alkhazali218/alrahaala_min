import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_transfer_accounts_list_item.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/cubit/transfer_account_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTransferAccountsList extends StatefulWidget {
  const CustomTransferAccountsList({super.key});
  static String id = 'CustomTransferAccountsList';

  @override
  State<CustomTransferAccountsList> createState() => _CustomTransferAccountsListState();
}

class _CustomTransferAccountsListState extends State<CustomTransferAccountsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TransferAccountListCubit>(context).fetchTransferAccountList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'عملية تحويل أموال',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: CustomTransferAccountsListItem(),
    );
  }
}
