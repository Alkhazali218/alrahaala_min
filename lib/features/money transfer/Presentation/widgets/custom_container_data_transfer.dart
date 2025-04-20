import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_data_get_transfer.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_data_text_transfer.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';

class CustomContainerDataTransfer extends StatelessWidget {
  const CustomContainerDataTransfer({super.key, required this.data});
  final DataGetTransferModel data;
  @override
  Widget build(BuildContext context) {
    String curCode = CacheNetWork.getCacheDaTaInfo(key: 'curCode');
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomDataGetTransfer(data: data),
            const CustomDataTextTransfer(),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'القيمة ${data.transValue} $curCode',
          style: googleFont30.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: getRsonsiveFontSize(context, fontSize: 23),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Image.asset(
                  assets.klogo,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(width: 30),
            const Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
