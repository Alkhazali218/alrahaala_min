import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/stack%20user%20star/Presentation/stack_user_view_star.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTransferUserItem extends StatelessWidget {
  CustomTransferUserItem({super.key});
  static String id = 'CustomTransferUserItem';
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
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
        child: ListView(
          children: [
            SizedBox(height: height * 0.040),
            textFromFiledItem(
              hintText: 'اسم لحساب',
              prefixIcon: FontAwesomeIcons.user,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.text,
              controller: controller,
            ),
            SizedBox(height: height * 0.012),
            textFromFiledItem(
              hintText: 'رقم الهاتف',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.text,
              controller: controller,
            ),
            SizedBox(height: height * 0.012),
            textFromFiledItem(
              hintText: 'رقم الحساب',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.text,
              controller: controller,
            ),
            SizedBox(height: height * 0.012),
            textFromFiledItem(
              hintText: 'الفرع',
              prefixIcon: FontAwesomeIcons.locationCrosshairs,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.text,
              controller: controller,
            ),
            SizedBox(height: height * 0.012),
            textFromFiledItem(
              hintText: 'القيمة المراد ارسالها',
              prefixIcon: FontAwesomeIcons.moneyBill,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.text,
              controller: controller,
            ),
            SizedBox(height: height * 0.035),
            Row(
              children: [
                CheckItem(
                  onTap: () =>
                      Navigator.pushNamed(context, StackUserViewStar.id),
                  textCheckItem: 'تاكيد',
                ),
                SizedBox(width: width * 0.020),
                CheckItem(
                  onTap: () => Navigator.pushNamed(context, homeView.id),
                  textCheckItem: 'الغاء الامر',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
