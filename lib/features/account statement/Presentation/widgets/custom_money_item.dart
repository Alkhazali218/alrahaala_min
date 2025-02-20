import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:flutter/material.dart';

class CustomMoneyItem extends StatelessWidget {
 const CustomMoneyItem({super.key,required this.data});
 final DataStatementModel data;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'القيمة',
                style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 50)),
              ),
              Text(
                data.valuesTo,
                style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
