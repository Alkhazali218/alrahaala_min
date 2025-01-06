import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({super.key,required this.onTap,required this.textCheckItem});
  final VoidCallback onTap;
  final String textCheckItem;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: kcolor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(textCheckItem,
          textAlign: TextAlign.center,
          style: googleFont30.copyWith(fontSize: 14,color: kprimaryColor),
          ),
        ),
      ),
    );
  }
}