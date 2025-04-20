import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/password/Presentation/widgets/custom_featch_password_item.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomOtpTextItem extends StatefulWidget {
  final String phone;

  CustomOtpTextItem({super.key, required this.phone});

  @override
  _CustomOtpTextItemState createState() => _CustomOtpTextItemState();
}

class _CustomOtpTextItemState extends State<CustomOtpTextItem> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    String code = CacheNetWork.getCacheDaTaInfo(key: 'code');
    const focusedBorderColor = kpColor;
    const fillColor = kprimaryColor;
    const borderColor = kpColor;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            Text(
              'ادخل كود التحقق',
              textAlign: TextAlign.center,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 30),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'تم ارسال رمز التحقق الى رقم الهاتف التالي ${widget.phone}',
              textAlign: TextAlign.center,
              style: googleFont18.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: pinController,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  
                  return value == code ? null : 'الكود غير صحيح';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: kpColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ButtonItem(
              textButton: 'التحقق',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  
                  if (pinController.text == code) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CustomFeatchPasswordItem(phone: widget.phone),
                      ),
                    );
                  } else {
                    AnimatedSnackBar.material('الكود غير صحيح',
                            type: AnimatedSnackBarType.error)
                        .show(context);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
