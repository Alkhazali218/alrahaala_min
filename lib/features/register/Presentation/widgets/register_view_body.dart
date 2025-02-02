import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_text_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/register/data/cubit/register_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  final userNameController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AnimatedSnackBar.material(
            'تم انشاء حساب بنجاح',
            type: AnimatedSnackBarType.success,
          ).show(context);
          Navigator.pushNamed(context, loginView.id);
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
                  'شركة الرحالة القابضة الاولى',
                  textAlign: TextAlign.right,
                  style: googleFont18.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                SizedBox(height: height * 0.02),
                textFromFiledItem(
                  controller: numberController,
                  hintText: 'رقم الهاتف',
                  prefixIcon: FontAwesomeIcons.hashtag,
                  pass: false,
                  isSecurePassword: false,
                  textType: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.02),
                textFromFiledItem(
                  controller: passwordController,
                  hintText: 'كلمة السر',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                ),
                SizedBox(height: height * 0.02),
                textFromFiledItem(
                  controller: passwordConfirmationController,
                  hintText: 'تاكيد كلمة السر',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                ),
                SizedBox(height: height * 0.02),
                state is RegisterLoading
                    ? const CustomCircular()
                    : ButtonItem(
                        textButton: 'انشاء حساب',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .userRegister(
                              userName: userNameController.text,
                              number: numberController.text,
                              password: passwordController.text,
                              passwordConfirmation: passwordConfirmationController.text,
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
}
