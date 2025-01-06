import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class moneyTransferItem extends StatelessWidget {
  const moneyTransferItem({super.key,required this.text,required this.onTap});

  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          width: 120,
          height: 65,
          decoration: BoxDecoration(
            color: kcolor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    text,
                    style: googleFont30.copyWith(
                        fontSize: 13,
                        color: kprimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(FontAwesomeIcons.plus,
                    size: 14, color: kprimaryColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
