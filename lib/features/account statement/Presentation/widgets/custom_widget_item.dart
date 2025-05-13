import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_money_item.dart';
import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_time_item.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:flutter/material.dart';

class CustomWidgetItem extends StatelessWidget {
  const CustomWidgetItem({super.key, required this.data});

  final DataStatementModel data;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTimeItem(data: data),
        SizedBox(width: width * 0.50),
        CustomMoneyItem(data: data),
        Flexible(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_balance_wallet_outlined,
                  size: getRsonsiveFontSize(context, fontSize: 30),
                  color: getIconColorBasedOnType(data.typeFrom)),
            ),
          ),
        ),
      ],
    );
  }

  // دالة لتحديد اللون بناءً على النوع
  Color getIconColorBasedOnType(String type) {
    if (type.contains("خصم")) {
      return Colors.red;
    } else if (type.contains("ايداع")) {
      return Colors.green;
    } else {
      return kpColor;
    }
  }
}
