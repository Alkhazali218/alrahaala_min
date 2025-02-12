import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key, required this.textButton, required this.onTap});
  final String textButton;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height * 0.08,
        decoration: BoxDecoration(
          color: kcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            textButton,
            style: googleFont30.copyWith(
                color: Colors.white,
                fontSize: getRsonsiveFontSize(context, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
