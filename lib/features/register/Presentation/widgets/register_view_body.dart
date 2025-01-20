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

// ignore: must_be_immutable, camel_case_types
class registerViewBody extends StatelessWidget {
  registerViewBody({super.key});
  late String userName;
  late String email;
  late String password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AnimatedSnackBar.material(
            state.message,
            type: AnimatedSnackBarType.success,
          ).show(context);
          Navigator.pushNamed(context, loginView.id);
        }
        if (state is RegisterFailures) {
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
                Image.asset(assets.klogo, height: 150),
                Text(
                  'انشاء حساب جديد',
                  textAlign: TextAlign.right,
                  style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 30),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'شركة الرحالة القابضة الاولى',
                  textAlign: TextAlign.right,
                  style: googleFont18.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 50),
                textFromFiledItem(
                  onChanged: (data) => userName = data,
                  hintText: 'اسم المستخدم',
                  prefixIcon: FontAwesomeIcons.user,
                  pass: false,
                  isSecurePassword: false,
                  textType: TextInputType.name,
                ),
                const SizedBox(height: 20),
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
                  hintText: 'كلمة السر',
                  prefixIcon: Icons.password,
                  pass: true,
                  isSecurePassword: true,
                  textType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 30),
                state is RegisterLoading
                    ? const CustomCircular()
                    : ButtonItem(
                        textButton: 'انشاء حساب',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).registerUser(
                              email: email,
                              password: password,
                            );
                          }
                        },
                      ),
                const SizedBox(height: 20),
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
