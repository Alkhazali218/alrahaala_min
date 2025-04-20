import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_notifiaction_body.dart';
import 'package:flutter/material.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key});
  static String id = 'custom_notification';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: CustomNotifiactionBody(),
    );
  }
}
