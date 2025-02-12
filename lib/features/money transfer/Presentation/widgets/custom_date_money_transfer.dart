import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomDateMoneyTransfer extends StatelessWidget {
  const CustomDateMoneyTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
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
            child: Text(formattedTime),
          ),
        ),
      ],
    );
  }
}
