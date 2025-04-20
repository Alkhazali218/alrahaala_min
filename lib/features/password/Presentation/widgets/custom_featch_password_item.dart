import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/password/Presentation/widgets/custom_password_item.dart';
import 'package:flutter/material.dart';

class CustomFeatchPasswordItem extends StatelessWidget {
  const CustomFeatchPasswordItem({super.key,required this.phone});
  static String id = 'CustomFeatchPasswordItem';
  final String phone;
  @override
  Widget build(BuildContext context) {
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