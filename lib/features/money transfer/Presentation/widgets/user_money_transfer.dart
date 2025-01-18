import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserMoneyTransfer extends StatelessWidget {
  const UserMoneyTransfer({super.key});

  static String id = 'UserMoneyTransfer';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'عملية تحويل الفوري',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            textFromFiledItem(
              onChanged: (p0) {},
              hintText: 'اسم المستلم',
              prefixIcon: FontAwesomeIcons.user,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            textFromFiledItem(
              onChanged: (p0) {},
              hintText: 'رقم  الهاتف المستلم',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            textFromFiledItem(
              onChanged: (p0) {},
              hintText: 'القيمة المراد ارسالها',
              prefixIcon: FontAwesomeIcons.moneyBill,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ButtonItem(
              textButton: 'تحويل',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
