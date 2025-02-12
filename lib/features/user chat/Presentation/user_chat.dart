import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/user_chat_body.dart';
import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  const UserChat({super.key});

  static String id = 'UserChat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'دردشة المستخدمين',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const UserChatBody(),
    );
  }
}
