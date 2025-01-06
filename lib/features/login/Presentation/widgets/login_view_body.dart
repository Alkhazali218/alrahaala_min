import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/cubit/Auth%20cubit/Auth_cubit.dart';
import 'package:alrahaala/cubit/Auth%20cubit/Auth_state.dart';
import 'package:alrahaala/cubit/chat%20cubit/chat_cubit.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/password/Presentation/password_view.dart';
import 'package:alrahaala/features/register/Presentation/register_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  bool isLoading = false;
  late String email;
  late String password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        }
        if (state is AuthSucess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, homeView.id);
          isLoading = false;
        }
        if (state is AuthError) {
          showSnackBar(context, state.message, Colors.red);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(kpColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Image.asset(assets.klogo, height: 150),
                  Text(
                    ' ! مرحبا بك',
                    textAlign: TextAlign.right,
                    style: googleFont30,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'قم بتسجيل الدخول للاستمرار',
                    textAlign: TextAlign.right,
                    style: googleFont18,
                  ),
                  const SizedBox(height: 50),
                  textFromFiledItem(
                    onChanged: (data) => email = data,
                    hintText: 'البريد الالكتروني',
                    prefixIcon: FontAwesomeIcons.envelope,
                    pass: false,
                    isSecurePassword: false,
                  ),
                  const SizedBox(height: 20),
                  textFromFiledItem(
                    onChanged: (data) => password = data,
                    hintText: 'كلمة المرور',
                    prefixIcon: Icons.password,
                    pass: true,
                    isSecurePassword: true,
                  ),
                  const SizedBox(height: 30),
                  ButtonItem(
                    textButton: 'تسجيل الدخول',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .login(email: email, password: password);
                      }
                      // subscribe to topic on each app start-up
                      await FirebaseMessaging.instance
                          .subscribeToTopic('alrahaala');
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
                        fontSize: 14,
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
          ),
        );
      },
    );
  }
}
