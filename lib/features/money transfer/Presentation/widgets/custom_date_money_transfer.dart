import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDateMoneyTransfer extends StatelessWidget {
  CustomDateMoneyTransfer({super.key,required this.data});
   DataGetTransferModel data;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    
    return Column(
      children: [
        const Flexible(
          child: FittedBox(
            child: Icon(
              FontAwesomeIcons.calendar,
              size: 20,
              color: kpColor,
            ),
          ),
        ),
        SizedBox(height: height * 0.0050),
        Flexible(
          child: FittedBox(
            child: Text(data.transDate),
          ),
        ),
      ],
    );
  }
}
