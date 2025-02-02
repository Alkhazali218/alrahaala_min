import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomBadgeItem extends StatelessWidget {
 const CustomBadgeItem({super.key, required this.userChatModel});
 final UserChatModel userChatModel;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm a').format(userChatModel.createdAt);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          formattedTime,
          style: googleFont18.copyWith(
            fontSize: getRsonsiveFontSize(context, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
