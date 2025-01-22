import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user/Presentation/widgets/text_item.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CloumItemUser extends StatelessWidget {
  const CloumItemUser({super.key,required this.text,required this.textMoney});

  final String text;
  final String textMoney;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
         SizedBox(height: height*0.04),
        Text(
          text,
          style: googleFont30.copyWith(color: Colors.black87, fontSize: getRsonsiveFontSize(context, fontSize: 16)),
        ),
         SizedBox(height: height* 0.010),
        Text(
          textMoney,
          style: googleFont30.copyWith(
            color: kpColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 30),
          ),
        ),
         SizedBox(height: height* 0.005),
        const textItem(
          textItemOne: '9685746146894321',
          textitemTwo: 'رقم الحساب',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        const textItem(
          textItemOne: '0921483085',
          textitemTwo: 'رقم الهاتف',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        const textItem(textItemOne: 'صالح الخزعلي', textitemTwo: 'الاسم'),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        const textItem(textItemOne: 'البيضاء', textitemTwo: 'الفرع'),
      ],
    );
  }
}
