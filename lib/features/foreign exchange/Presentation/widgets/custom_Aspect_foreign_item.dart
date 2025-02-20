import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/customWidget_foregin_item.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:flutter/material.dart';

class CustomAspectForeginItem extends StatelessWidget {
  const CustomAspectForeginItem({super.key,required this.dataDepositModel});
  final DataDepositModel dataDepositModel;

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
        child: CustomWidgetForeignItem(data: dataDepositModel),
      ),
    );
  }
}