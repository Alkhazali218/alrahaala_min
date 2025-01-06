import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user/Presentation/widgets/stack_item_user.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class userViewBody extends StatelessWidget {
  const userViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 40),
        const stackItemUser(),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Text(
            'تسجيل الخروج',
            style: googleFont30.copyWith(color: kpColor, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
