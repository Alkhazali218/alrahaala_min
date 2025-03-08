import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomOtpTextItem extends StatelessWidget {
  final Function(String) onCodeChanged; // دالة لتمرير الكود المدخل
  final Function() onTap;

  const CustomOtpTextItem(
      {super.key, required this.onCodeChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 100),
          Text(
            'ادخل كود التحقق',
            style: googleFont30.copyWith(
              fontSize: getRsonsiveFontSize(
                context,
                fontSize: 30,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'قم بادخال البيانات لكي نقوم بمتابعة العملية',
            style: googleFont18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          OtpTextField(
            numberOfFields: 5,
            borderColor: kpColor,
            focusedBorderColor: kpColor,
            showFieldAsBox: true,
            onCodeChanged: onCodeChanged, // تمرير الدالة من الخارج
            onSubmit: onCodeChanged, // أيضاً عند تقديم الكود نمرر القيمة
          ),
          const SizedBox(height: 20),
          ButtonItem(
            textButton: 'التحقق',
            onTap: onTap, // التحقق عند النقر
          ),
        ],
      ),
    );
  }
}
