import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class chatView extends StatelessWidget {
  const chatView({super.key});
  static String id = 'chatView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body:const ChatViewBody(),
    );
  }
}