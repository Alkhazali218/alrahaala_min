import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/password/Presentation/widgets/custom_password_item.dart';
import 'package:flutter/material.dart';

class CustomFeatchPasswordItem extends StatelessWidget {
  const CustomFeatchPasswordItem({super.key});
  static String id = 'CustomFeatchPasswordItem';
  @override
  Widget build(BuildContext context) {
    String phone = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
      ),
      body: CustomPasswordItem(phone: phone),
    );
  }
}