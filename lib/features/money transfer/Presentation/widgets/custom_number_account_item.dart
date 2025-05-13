import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomNumberAccountItem extends StatelessWidget {
 CustomNumberAccountItem({super.key,required this.data});
  DataGetTransferModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              data.accCode,
              style: googleFont30.copyWith(
                color: Colors.black,
                fontSize: getRsonsiveFontSize(
                  context,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
              NumberFormat('#,###.###').format(double.tryParse(data.transValue) ?? 0),
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(
                  context,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
