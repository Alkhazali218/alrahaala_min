import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomWidgetMoney extends StatelessWidget {
  const CustomWidgetMoney({super.key, required this.text});

final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 13),
                color: kprimaryColor,
                fontWeight: FontWeight.bold),
          ),
           Icon(
            FontAwesomeIcons.plus,
            size: getRsonsiveFontSize(context, fontSize: 14),
            color: kprimaryColor,
          ),
        ],
      ),
    );
  }
}