import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/login_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/password/data/cubit/password_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordViewBody extends StatelessWidget {
  PasswordViewBody({super.key});
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            const SizedBox(height: 15),
            TextFromFiledItem(
              controller: passwordController,
              hintText: 'كلمة السر الجديدة',
              prefixIcon: Icons.password,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            BlocConsumer<PasswordCubit, PasswordState>(
              listener: (context, state) {
                if (state is PasswordSuccess) {
                  Navigator.pushNamed(context, loginView.id);
                  AnimatedSnackBar.material('تم تغيير كلمة المرور بنجاح',
                          type: AnimatedSnackBarType.success)
                      .show(context);
                } else if (state is PasswordFaliures) {
                  AnimatedSnackBar.material(state.message,
                          type: AnimatedSnackBarType.error)
                      .show(context);
                }
              },
              builder: (context, state) {
                return state is PasswordLoading? const CustomCircular() :ButtonItem(
                  textButton: 'متابعة',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      String deviceId = await getDeviceId();
                      BlocProvider.of<PasswordCubit>(context).featchPassword(
                      phone: phoneController.text,
                      password: passwordController.text,
                      deviceId: deviceId,
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
}
