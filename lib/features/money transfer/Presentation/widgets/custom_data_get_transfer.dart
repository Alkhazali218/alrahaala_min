import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';

class CustomDataGetTransfer extends StatelessWidget {
  const CustomDataGetTransfer({super.key,required this.data});
  final DataGetTransferModel data;
  @override
  Widget build(BuildContext context) {
    String accCode = CacheNetWork.getCacheDaTaInfo(key: 'AccCode');
    return Flexible(
      child: FittedBox(
        child: Column(
          children: [
            Text(
              data.transDate,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 20),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data.accCode,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 20),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              accCode,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 20),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data.typeTrns,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 20),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'ناجحة',
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 20),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data.code,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 20),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
