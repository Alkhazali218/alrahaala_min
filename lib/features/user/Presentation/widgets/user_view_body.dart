import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user/Presentation/widgets/stack_item_user.dart';
import 'package:flutter/material.dart';

class UserViewBody extends StatelessWidget {
  const UserViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 40),
        const StackItemUser(),
        const SizedBox(height: 20),
        Text(
          'تسجيل الخروج',
          style: googleFont30.copyWith(
              color: kpColor,
              fontSize: getRsonsiveFontSize(context, fontSize: 16)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
