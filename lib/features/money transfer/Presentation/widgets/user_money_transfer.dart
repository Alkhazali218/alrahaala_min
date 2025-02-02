import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_transfer_user_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserMoneyTransfer extends StatelessWidget {
   UserMoneyTransfer({super.key});

  static String id = 'UserMoneyTransfer';

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تحويل الاموال',
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
            SizedBox(height: height * 0.05),
            textFromFiledItem(
              controller: controller,
              hintText: 'رقم حساب المستلم',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            SizedBox(height: height * 0.020),
            textFromFiledItem(
              controller: controller,
              hintText: 'القيمة المراد ارسالها',
              prefixIcon: FontAwesomeIcons.moneyBill,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
           SizedBox(height: height * 0.035),
            ButtonItem(
              textButton: 'تحويل',
              onTap: () {
                Navigator.pushReplacementNamed(context, CustomTransferUserItem.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
