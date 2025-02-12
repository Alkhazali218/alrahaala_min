import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/foreign_exchange_view_body.dart';
import 'package:flutter/material.dart';

class ForeignExchangeView extends StatelessWidget {
  const ForeignExchangeView({super.key});
  static String id = 'ForeignExchangeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'رصيد النقد الاجنبي',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const ForeignExchangeViewBody(),
    );
  }
}
