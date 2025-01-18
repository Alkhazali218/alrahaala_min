import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/login/data/cubit/sing_in_cubit.dart';
import 'package:alrahaala/features/password/Presentation/password_view.dart';
import 'package:alrahaala/features/register/Presentation/register_view.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginViewBody extends StatelessWidget {
  late String email;
  late String password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingInCubit, SingInState>(
      listener: (context, state) {
        if (state is SingInSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, homeView.id);
          AnimatedSnackBar.material(state.message,
                  type: AnimatedSnackBarType.success)
              .show(context);
        } else if (state is SingInFailures) {
          AnimatedSnackBar.material(state.message,
                  type: AnimatedSnackBarType.error)
              .show(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(assets.klogo, height: 150),
                Text(
                  ' ! مرحبا بك',
                  textAlign: TextAlign.right,
                  style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 30),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'قم بتسجيل الدخول للاستمرار',
                  textAlign: TextAlign.right,
                  style: googleFont18.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 50),
                textFromFiledItem(
                  onChanged: (data) => email = data,
                  hintText: 'البريد الالكتروني',
                  prefixIcon: FontAwesomeIcons.envelope,
                  pass: false,
                  isSecurePassword: false,
                  textType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                textFromFiledItem(
                  onChanged: (data) => password = data,
                  hintText: 'كلمة المرور',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 30),
               state is SingInLoading
                    ? const CustomCircular()
                    :  ButtonItem(
                  textButton: 'تسجيل الدخول',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SingInCubit>(context)
                          .loginUser(email: email, password: password);
                    }
                    await FirebaseMessaging.instance.subscribeToTopic(kTopic);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, passwordView.id),
                  child: Text(
                    'هل نسيت كلمة السر؟',
                    textAlign: TextAlign.center,
                    style: googleFont18.copyWith(
                      color: kpColor,
                      fontSize: getRsonsiveFontSize(context, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                buttonTextItem(
                  ifText: ' ليس لديك حساب؟',
                  textLandtextR: 'انشاء حساب',
                  onTap: () => Navigator.pushNamed(context, registerView.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
