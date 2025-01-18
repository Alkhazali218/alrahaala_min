import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class buttonTextItem extends StatelessWidget {
  buttonTextItem(
      {super.key,
      required this.ifText,
      required this.textLandtextR,
      required this.onTap});
  String ifText;
  String textLandtextR;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            textLandtextR,
            style: googleFont18.copyWith(
              color: kpColor,
              fontSize: getRsonsiveFontSize(context, fontSize: 14),
              decoration: TextDecoration.underline,
              decorationColor: kpColor,
            ),
          ),
        ),
        Text(
          ifText,
          style: googleFont18.copyWith(fontSize: getRsonsiveFontSize(context, fontSize: 14)),
        ),
      ],
    );
  }
}
