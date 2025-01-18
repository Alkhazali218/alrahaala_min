import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_widget_item.dart';
import 'package:flutter/material.dart';

class CustomAspectItem extends StatelessWidget {
  const CustomAspectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: const CustomWidgetItem(),
      ),
    );
  }
}