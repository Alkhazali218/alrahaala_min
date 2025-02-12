import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/user/Presentation/widgets/text_item.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CloumItemUser extends StatelessWidget {
  CloumItemUser({super.key, required this.text, required this.textMoney});

  final String text;
  final String textMoney;

  String accName = CacheNetWork.getCacheDaTaInfo(key: 'AccName');
  String bName = CacheNetWork.getCacheDaTaInfo(key: 'BName');
  String accCode = CacheNetWork.getCacheDaTaInfo(key: 'AccCode');
  String phone = CacheNetWork.getCacheDaTaInfo(key: 'phone');
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        SizedBox(height: height * 0.04),
        Text(
          text,
          style: googleFont30.copyWith(
              color: Colors.black87,
              fontSize: getRsonsiveFontSize(context, fontSize: 16)),
        ),
        SizedBox(height: height * 0.010),
        Text(
          textMoney,
          style: googleFont30.copyWith(
            color: kpColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 30),
          ),
        ),
        SizedBox(height: height * 0.005),
        textItem(
          textItemOne: accCode,
          textitemTwo: 'رقم الحساب',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        textItem(
          textItemOne: phone,
          textitemTwo: 'رقم الهاتف',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        textItem(textItemOne: accName, textitemTwo: 'الاسم'),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        textItem(textItemOne: bName, textitemTwo: 'الفرع'),
      ],
    );
  }
}
