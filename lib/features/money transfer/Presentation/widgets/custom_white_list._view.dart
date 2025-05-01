import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_number_account_white_list.dart';
import 'package:flutter/material.dart';

class CustomWhiteListView extends StatelessWidget {
  const CustomWhiteListView({super.key});

  static String id = 'CustomWhileListView';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'القائمة البيضاء',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: height * 0.025),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: CustomNumberAcountWhiteList(),
    );
  }
}


