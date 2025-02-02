import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/navigator_foreign_item_body.dart';
import 'package:flutter/material.dart';

class NavigatorForeignItem extends StatelessWidget {
  const NavigatorForeignItem({super.key});
  static String id = 'NavigatorForeignItem';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        centerTitle: true,
        title: Text(
          'كشف الحساب',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const NavigatorForeignItemBody(),
   );
  }

}