import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CustomDataTextTransfer extends StatelessWidget {
  const CustomDataTextTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          ': تاريخ التحويل',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          ': رقم  المستفيد',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          ': رقم  الزبون',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          ': عملية التحويل',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          ': حالة العملية',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          ': رقم العملية',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
