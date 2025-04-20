import 'dart:math';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/otp/Presentation/otp_view.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordViewBody extends StatelessWidget {
  PasswordViewBody({super.key});

  final phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // تخزين الرقم العشوائي في متغير ثابت
  final int randomNumber = 1000 + Random().nextInt(9000);

  @override
  Widget build(BuildContext context) {
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
                fontSize: getRsonsiveFontSize(context, fontSize: 30),
              ),
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
                if (state is OtpSuccess) {
                  CacheNetWork.insterToInfo(
                    key: 'code',
                    value: randomNumber.toString(),
                  );
                  Navigator.pushNamed(context, OtpView.id,arguments: phoneController.text);
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
                      await BlocProvider.of<OtpCubit>(context).featchOtp(
                      phone: phoneController.text,
                      message:
                          'كود التحقق الخاص بكَ\n${randomNumber.toString()}\nلا تطلع أحداً عليه',
                    );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
