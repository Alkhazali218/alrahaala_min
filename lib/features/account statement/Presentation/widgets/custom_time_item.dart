import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CustomTimeItem extends StatelessWidget {
  const CustomTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Flexible(
      child: FittedBox(
        child: Column(
          children: [
            SizedBox(height: height * 0.010),
            Text(
              '01/01/2025',
              style: googleFont18.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
            Text(
              'خصم',
              style: googleFont18.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}
