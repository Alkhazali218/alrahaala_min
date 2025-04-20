import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/next%20ex/Presentation/otp/custom_otp_next_ex_text_item.dart';
import 'package:flutter/material.dart';

class OtpNexteXView extends StatelessWidget {
  const OtpNexteXView({super.key});
  static String id = 'OtpNexteXView';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // استخراج البيانات من الـ Map
    String name = arguments['name']!;
    String phone = arguments['phone']!;
    String amount = arguments['amount']!;
    String bank = arguments['bank']!;
    String selectedCityId = arguments['selectedCityId']!;
    String selectedDeliveredCurrencyId = arguments['selectedDeliveredCurrencyId']!;
    String selectedcountryIdTo = arguments['selectedcountryIdTo']!;
    String selectedServiceType = arguments['selectedServiceType']!;
    String code = arguments['code']!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
        primary: true,
      ),
      body: CustomOtpNextExTextItem(
        code: code,
        nameController: name,
        amountController: amount,
        bankController: bank,
        phoneController: phone,
        selectedCityId: selectedCityId,
        selectedDeliveredCurrencyId: selectedDeliveredCurrencyId,
        selectedServiceType: selectedServiceType,
        selectedcountryIdTo: selectedcountryIdTo,
      ),
    );
  }
}
