import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';

class CustomUserNameItem extends StatelessWidget {
  const CustomUserNameItem({
    super.key,
    required this.userChatModel,
    this.chatMessageModel,
  });

  final UserChatModel userChatModel;
  final ChatMessageModel? chatMessageModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    // تقسيم الاسم إلى كلمات وأخذ أول أربع فقط
    final List<String> nameParts = userChatModel.userName.split(' ');
    final String trimmedName = nameParts.length > 4
        ? nameParts.take(4).join(' ')
        : userChatModel.userName;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * 0.018),
          Text(
            trimmedName,
            style: googleFont30.copyWith(
              fontSize: getRsonsiveFontSize(context, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
