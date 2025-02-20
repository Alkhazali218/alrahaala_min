import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:flutter/widgets.dart';

class CustomMoneyForeignItem extends StatelessWidget {
 const CustomMoneyForeignItem({super.key,required this.data});

  final DataDepositModel data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'القيمة',
                style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 50)),
              ),
              Text(
                data.valueTo,
                style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}