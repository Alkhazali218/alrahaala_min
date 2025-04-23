import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/data/transfer%20account%20list/models/transfer_account_list_models.dart';
import 'package:flutter/material.dart';

class CustomTextTransferAccountList extends StatelessWidget {
  const CustomTextTransferAccountList({super.key, required this.data});
  final DataTransferAccountListModels data;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
               data.accName.replaceFirst("حساب ", ""),
              style: googleFont30.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: getRsonsiveFontSize(
                  context,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.010),
        Flexible(
          child: FittedBox(
            child: Text(
              data.accCode,
              style: googleFont30.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: getRsonsiveFontSize(
                  context,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}