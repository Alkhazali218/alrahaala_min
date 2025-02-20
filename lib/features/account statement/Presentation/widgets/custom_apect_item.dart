import 'package:alrahaala/features/account%20statement/Presentation/widgets/custom_widget_item.dart';
import 'package:alrahaala/features/account%20statement/data/model/statement_model.dart';
import 'package:flutter/material.dart';

class CustomAspectItem extends StatelessWidget {
  const CustomAspectItem({super.key,required this.data});
  
  final DataStatementModel data;
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
        child: CustomWidgetItem(data: data),
      ),
    );
  }
}
