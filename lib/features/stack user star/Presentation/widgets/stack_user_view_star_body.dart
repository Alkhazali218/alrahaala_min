import 'package:alrahaala/features/stack%20user%20star/Presentation/widgets/custom_cloum_item.dart';
import 'package:flutter/material.dart';

class StackUserViewStarBody extends StatelessWidget {
  const StackUserViewStarBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         SizedBox(height: 60),
        CustomCloumItem(),
      ],
    );
  }
}

