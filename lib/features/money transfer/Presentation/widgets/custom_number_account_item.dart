import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CustomNumberAccountItem extends StatelessWidget {
  const CustomNumberAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              '0987564321456789',
              style: googleFont30.copyWith(
                color: Colors.black,
                fontSize: getRsonsiveFontSize(
                  context,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
              '600000',
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(
                  context,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
