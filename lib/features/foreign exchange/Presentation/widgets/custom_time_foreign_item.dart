import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:flutter/widgets.dart';

class CustomTimeForeignItem extends StatelessWidget {
  const CustomTimeForeignItem({super.key, required this.data});

  final DataDepositModel data;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Flexible(
      child: FittedBox(
        child: Column(
          children: [
            SizedBox(height: height * 0.010),
            Text(
              data.insertDate,
              style: googleFont18.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
            Text(
              data.typeFrom,
              style: googleFont18.copyWith(
                  fontSize: getRsonsiveFontSize(context, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}