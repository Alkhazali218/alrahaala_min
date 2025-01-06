import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/user/Presentation/widgets/cloum_item_user.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class stackItemUser extends StatelessWidget {
  const stackItemUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorStack,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: CloumItemUser(
              text: 'الرصيد الحالي',
              textMoney: '20,250,098',
            ),
          ),
        ),
      ],
    );
  }
}
