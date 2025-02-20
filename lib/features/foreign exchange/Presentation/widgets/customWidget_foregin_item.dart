import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/custom_monet_foreign_item.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/custom_time_foreign_item.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:flutter/material.dart';

class CustomWidgetForeignItem extends StatelessWidget {
  const CustomWidgetForeignItem({super.key, required this.data});
  final DataDepositModel data;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTimeForeignItem(data: data),
        SizedBox(width: width * 0.50),
        CustomMoneyForeignItem(data: data),
        Flexible(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: getRsonsiveFontSize(context, fontSize: 40),
                color: getIconColorBasedOnType(data.typeFrom), // تم تعديل هنا
              ),
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