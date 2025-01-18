import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CustomTimeItem extends StatelessWidget {
  const CustomTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              '01/01/2025',
              style: googleFont18.copyWith(fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
            Text(
              'خصم',
              style: googleFont18.copyWith(fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}