import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/next/Presentation/otp/custom_otp_next_text_item.dart';
import 'package:flutter/material.dart';

class OtpNextView extends StatelessWidget {
  const OtpNextView({super.key});
  static String id = 'OtpNextView';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String phone = arguments['phone']!;
    String name = arguments['name']!;
    String verificationCode = arguments['code']!;
    String amount = arguments['amount']!;
    String cityId = arguments['cityId']!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
        primary: true,
      ),
      body: CustomOtpNextTextItem(
        code: verificationCode,
        phone: phone,
        name: name,
        amount: amount,
        cityId: cityId,
      ),
    );
  }
}
