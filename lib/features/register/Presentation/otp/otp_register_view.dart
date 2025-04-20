import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/register/Presentation/otp/custom_otp_rigster.dart';
import 'package:flutter/material.dart';

class OtpRegisterView extends StatelessWidget {
  const OtpRegisterView({super.key});
  static String id = 'OtpRegisterView';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> code =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // استخراج البيانات من الـ Map
    String phone = code['phone']!;
    String password = code['password']!;
    String verificationCode = code['code']!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
        primary: true,
      ),
      body: CustomOtpRegisterTextItem(
        code: verificationCode,
        phone: phone,
        password: password,
      ),
    );
  }
}
