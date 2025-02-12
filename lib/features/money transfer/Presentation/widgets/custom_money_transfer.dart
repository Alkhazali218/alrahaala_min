import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_date_money_transfer.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_number_account_item.dart';
import 'package:flutter/material.dart';

class CustomMoneyTransfer extends StatelessWidget {
  const CustomMoneyTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: height * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
            color: kcolor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomDateMoneyTransfer(),
              SizedBox(height: height * 0.020),
              const CustomNumberAccountItem(),
            ],
          ),
        ),
      ),
    );
  }
}
