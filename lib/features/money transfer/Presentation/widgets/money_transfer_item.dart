import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_widget_money.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/user_money_transfer.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class moneyTransferItem extends StatelessWidget {
  const moneyTransferItem({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UserMoneyTransfer.id);
      },
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            width: 120,
            height: 65,
            decoration: BoxDecoration(
              color: kcolor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CustomWidgetMoney(text: text),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
