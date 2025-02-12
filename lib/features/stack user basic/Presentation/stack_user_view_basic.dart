import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/stack%20user%20basic/Presentation/widgets/stack_user_view_basic_body.dart';
import 'package:flutter/material.dart';

class StackUserViewBasic extends StatelessWidget {
  const StackUserViewBasic({super.key});
  static String id = 'stack User View Basic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const StackUserViewBasicBody(),
    );
  }
}
