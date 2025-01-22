import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_money_item.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_time_item.dart';
import 'package:flutter/material.dart';

class CustomWidgetItem extends StatelessWidget {
  const CustomWidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      const  CustomTimeItem(),
        SizedBox(width: width * 0.50),
       const CustomMoneyItem(),
        Flexible(
          child: FittedBox(
            child: Padding(
              padding:const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size:  getRsonsiveFontSize(context, fontSize: 40),
                color: kpColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}