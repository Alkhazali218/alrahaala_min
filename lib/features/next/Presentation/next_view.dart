import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/next/Presentation/widgets/next_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class nextView extends StatelessWidget {
  const nextView({super.key});

  static String id = 'next View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        automaticallyImplyLeading: false,
      ),
      body:const NextViewBody(),
    );
  }
}
