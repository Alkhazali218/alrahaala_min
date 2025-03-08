import 'dart:math';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/otp/Presentation/otp_view.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
import 'package:alrahaala/features/password/Presentation/widgets/custom_featch_password_item.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordViewBody extends StatelessWidget {
  PasswordViewBody({super.key});
  final phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var random = Random();
    int randomNumber = 10000 + random.nextInt(90000);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            Text(
              'البحث عن حساب',
              style: googleFont30.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 30)),
              textAlign: TextAlign.right,
            ),
            Text(
              'ادخل الرقم الهاتف',
              style: googleFont18,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            TextFromFiledItem(
              controller: phoneController,
              hintText: 'رقم الهاتف',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Text(
              'قد تتلقى منا اشعارات عبر واتساب لاغراض الامان وتسجيل الدخول',
              style: googleFont18,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 30),
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if (state is OtpSucces) {
                  // الانتقال إلى OtpView مع الدوال
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpView(
                        phone: phoneController.text,
                        onCodeChanged: (code) {
                          // حفظ الكود المدخل عند تغييره
                        },
                        onTap: (enteredCode) {
                          // التحقق من الكود عند النقر
                          onTap(context, phoneController.text, enteredCode,
                              randomNumber.toString());
                        },
                      ),
                    ),
                  );
                } else if (state is OtpFaliures) {
                  AnimatedSnackBar.material(state.message,
                          type: AnimatedSnackBarType.error)
                      .show(context);
                }
              },
              builder: (context, state) {
                if (state is OtpLoading) {
                  return const CustomCircular();
                }
                return ButtonItem(
                  textButton: 'متابعة',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<OtpCubit>(context).featchOtp(
                        phone: phoneController.text,
                        message:
                            'كود التحقق الخاص بكَ\n${randomNumber.toString()}\nلا تطلع أحداً عليه',
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  // دالة التحقق من الكود
  void onTap(BuildContext context, String phone, String enteredCode,
      String originalCode) {
    if (enteredCode == originalCode) {
      AnimatedSnackBar.material("الكود صحيح! الآن يمكنك متابعة العملية.",
              type: AnimatedSnackBarType.success)
          .show(context);

      Navigator.pushNamed(context, CustomFeatchPasswordItem.id,
          arguments: phone);
    } else {
      AnimatedSnackBar.material("الكود غير صحيح",
              type: AnimatedSnackBarType.error)
          .show(context);
    }
  }
}
