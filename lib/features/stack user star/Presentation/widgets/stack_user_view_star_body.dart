import 'package:alrahaala/features/stack%20user%20star/Presentation/widgets/custom_cloum_item.dart';
import 'package:flutter/material.dart';

class StackUserViewStarBody extends StatelessWidget {
  const StackUserViewStarBody({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return  Column(
      children: [
         SizedBox(height: height * 0.040),
      const  CustomCloumItem(),
      ],
    );
  }
}