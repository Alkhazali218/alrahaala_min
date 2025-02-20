import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/user/Presentation/widgets/cloum_item_user.dart';
import 'package:flutter/material.dart';

class StackItemUser extends StatelessWidget {
  const StackItemUser({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: height * 0.50,
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
            ),
          ),
        ),
      ],
    );
  }
}
