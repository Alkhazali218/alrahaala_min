import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_apect_item.dart';
import 'package:flutter/material.dart';

class NavigatorForeignItemBody extends StatelessWidget {
  const NavigatorForeignItemBody({super.key});

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
      itemBuilder: (context, index) {
        return const CustomAspectItem();
      },
    );
  }
}