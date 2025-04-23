import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:flutter/material.dart';

class CustomDataTextTransfer extends StatelessWidget {
  const CustomDataTextTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ': تاريخ التحويل',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
         SizedBox(height: height * 0.025),
        Text(
          ': رقم المستفيد',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
        SizedBox(height: height * 0.025),
        Text(
          ': رقم حساب الزبون',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
        SizedBox(height: height * 0.025),
        Text(
          ': عملية التحويل',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
        SizedBox(height: height * 0.025),
        Text(
          ': حالة العملية',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
        SizedBox(height: height * 0.025),
        Text(
          ': رقم العملية',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
        SizedBox(height: height * 0.025),
        Text(
          ': قيمة الخصم',
          style: googleFont30.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
