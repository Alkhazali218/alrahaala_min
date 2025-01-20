import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CustomMoneyItem extends StatelessWidget {
  const CustomMoneyItem({super.key});

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
                    fontSize: getRsonsiveFontSize(context, fontSize: 18)),
              ),
              Text(
                '650',
                style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
