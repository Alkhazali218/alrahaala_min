import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/otp/custom_otp_transfer_text_item.dart';
import 'package:flutter/material.dart';

class OtpTransferView extends StatelessWidget {
  const OtpTransferView({super.key});
  static String id = 'OtpTransferView';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String amount = arguments['amount']!;
    String accIdTo = arguments['accidTo']!;
    String code = arguments['code']!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
        primary: true,
      ),
      body: CustomOtpTransferTextItem(
        code: code,
        amount: amount,
        accIdTo: accIdTo,
      ),
    );
  }
}
