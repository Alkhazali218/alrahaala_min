import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/login/data/cubit/login_cubit.dart';
import 'package:alrahaala/features/password/Presentation/password_view.dart';
import 'package:alrahaala/features/register/Presentation/register_view.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {

          Navigator.pushNamed(context, homeView.id);

          AnimatedSnackBar.material('تم تسجيل الدخول بنجاح',
                  type: AnimatedSnackBarType.success)
              .show(context);
        } else if (state is LoginFaliures) {
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
                Image.asset(assets.klogo, height: height * 0.20),
                Text(
                  ' ! مرحبا بك',
                  textAlign: TextAlign.right,
                  style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 30),
                  ),
                ),
                SizedBox(height: height * 0.0050),
                Text(
                  'قم بتسجيل الدخول للاستمرار',
                  textAlign: TextAlign.right,
                  style: googleFont18.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                SizedBox(height: height * 0.04),
                textFromFiledItem(
                  controller: numberController,
                  hintText: 'رقم الهاتف',
                  prefixIcon: FontAwesomeIcons.hashtag,
                  pass: false,
                  isSecurePassword: false,
                  textType: TextInputType.number,
                ),
               SizedBox(height: height * 0.02),
                textFromFiledItem(
                 controller: passwordController,
                  hintText: 'كلمة المرور',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                ),
               SizedBox(height: height * 0.02),
                state is LoginLoading
                    ? const CustomCircular()
                    : ButtonItem(
                        textButton: 'تسجيل الدخول',
                        onTap: ()  {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).loginUser(
                                number: numberController.text,
                                password: passwordController.text,
                                context: context);
                          }
                        },
                      ),
               SizedBox(height: height * 0.02),
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
               SizedBox(height: height * 0.03),
                buttonTextItem(
                  ifText: ' ليس لديك حساب؟',
                  textLandtextR: 'انشاء حساب',
                  onTap: () => Navigator.pushNamed(context, RegisterView.id),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
