import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/otp/Presentation/widgets/custom_otp_text_item.dart';
import 'package:flutter/material.dart';


class OtpView extends StatelessWidget {
  const OtpView({super.key});
  static String id = 'OtpView';

  @override
  Widget build(BuildContext context) {
    String phone = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
        primary: true,
      ),
      body: CustomOtpTextItem(phone: phone),
    );
  }
}

