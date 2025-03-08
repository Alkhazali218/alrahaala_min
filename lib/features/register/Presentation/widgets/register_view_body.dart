import 'dart:math';

import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/otp/Presentation/otp_view.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
import 'package:alrahaala/features/register/data/cubit/register_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  _RegisterViewBodyState createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var random = Random();
    int randomNumber = 10000 + random.nextInt(90000);

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
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
                  Navigator.pushNamed(context, loginView.id);
                  AnimatedSnackBar.material('تم انشاء حساب بنجاح',
                          type: AnimatedSnackBarType.success)
                      .show(context);
                },
              ),
            ),
          );
        }
        if (state is RegisterFaliures) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.error,
          ).show(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Image.asset(assets.klogo, height: height * 0.20),
                Text(
                  'انشاء حساب جديد',
                  textAlign: TextAlign.right,
                  style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 30),
                  ),
                ),
                SizedBox(height: height * 0.0050),
                Text(
                  'شركة الرحالة لصرافة وتحويل الاموال',
                  textAlign: TextAlign.right,
                  style: googleFont18.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                SizedBox(height: height * 0.02),
                TextFromFiledItem(
                  controller: phoneController,
                  hintText: 'رقم الهاتف',
                  prefixIcon: FontAwesomeIcons.hashtag,
                  pass: false,
                  isSecurePassword: false,
                  textType: TextInputType.phone,
                ),
                SizedBox(height: height * 0.02),
                TextFromFiledItem(
                  controller: passwordController,
                  hintText: 'كلمة السر',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                ),
                SizedBox(height: height * 0.02),
                // إضافة حقل تأكيد كلمة السر
                TextFromFiledItem(
                  controller: passwordConfirmationController,
                  hintText: 'تأكيد كلمة السر',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'كلمات السر غير متطابقة';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                state is RegisterLoading
                    ? const CustomCircular()
                    : ButtonItem(
                        textButton: 'انشاء حساب',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            onTap(
                                context,
                                phoneController.text,
                                randomNumber.toString(),
                                randomNumber.toString());
                            BlocProvider.of<OtpCubit>(context).featchOtp(
                              phone: phoneController.text,
                              message:
                                  'كود التحقق الخاص بكَ\n${randomNumber.toString()}\nلا تطلع أحداً عليه',
                            );
                          }
                        },
                      ),
                SizedBox(height: height * 0.03),
                buttonTextItem(
                  ifText: ' هل لديك حساب بالفعل؟',
                  textLandtextR: 'تسجيل الدخول',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // دالة التحقق من الكود
  void onTap(BuildContext context, String phone, String enteredCode,
      String originalCode) async {
    if (enteredCode == originalCode) {
      String deviceId = await getDeviceId();
      // ignore: use_build_context_synchronously
      BlocProvider.of<RegisterCubit>(context).userRegister(
        phone: phoneController.text,
        password: passwordController.text,
        deviceId: deviceId,
      );
    } else {
      AnimatedSnackBar.material("الكود غير صحيح",
              type: AnimatedSnackBarType.error)
          .show(context);
    }
  }
}
