import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';

class CustomUserNameItem extends StatelessWidget {
  const CustomUserNameItem(
      {super.key, required this.userChatModel, this.chatMessageModel});

  final UserChatModel userChatModel;
  final ChatMessageModel? chatMessageModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * 0.020),
          Text(
            userChatModel.userName,
            style: googleFont30.copyWith(
              fontSize: getRsonsiveFontSize(context, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
