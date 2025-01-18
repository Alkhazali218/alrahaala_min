import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_money_item.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_time_item.dart';
import 'package:flutter/material.dart';

class CustomWidgetItem extends StatelessWidget {
  const CustomWidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTimeItem(),
        SizedBox(width: 215),
        CustomMoneyItem(),
        Flexible(
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: 40,
                color: kpColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}