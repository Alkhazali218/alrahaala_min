import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/money_transfer_view_body.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyTransferView extends StatefulWidget {
  const MoneyTransferView({super.key});
  static String id = 'MoneyTransferView';

  @override
  State<MoneyTransferView> createState() => _MoneyTransferViewState();
}

class _MoneyTransferViewState extends State<MoneyTransferView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTransferCubit>(context).getTransfer();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const MoneyTransferViewBody(),
    );
  }
}
