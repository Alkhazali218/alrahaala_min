import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:flutter/material.dart';

class CustomTimeItem extends StatelessWidget {
  const CustomTimeItem({super.key,required this.data});
 final DataStatementModel data;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Flexible(
      child: FittedBox(
        child: Column(
          children: [
            SizedBox(height: height * 0.010),
            Text(
              data.insertDate,
              style: googleFont18.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
            Text(
              data.typeFrom,
              style: googleFont18.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

