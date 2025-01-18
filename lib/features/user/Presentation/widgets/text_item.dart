import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class textItem extends StatelessWidget {
  const textItem(
      {super.key, required this.textItemOne, required this.textitemTwo});
  final String textItemOne;
  final String textitemTwo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textItemOne,
            style: googleFont30.copyWith(fontSize: getRsonsiveFontSize(context, fontSize: 14), color: Colors.black54),
          ),
          Text(
            textitemTwo,
            style: googleFont30.copyWith(color: Colors.black87, fontSize: getRsonsiveFontSize(context, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
