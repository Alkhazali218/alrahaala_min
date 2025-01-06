import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/money_transfer_view_body.dart';
import 'package:flutter/material.dart';

class MoneyTransferView extends StatelessWidget {
  const MoneyTransferView({super.key});
  static String id = 'MoneyTransferView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: kcolor,
      foregroundColor: kprimaryColor,
    ),
    body: const MoneyTransferViewBody(),
   );
  }

}