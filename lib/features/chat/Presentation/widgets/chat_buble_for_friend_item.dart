import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class chatBubleForFriendItem extends StatelessWidget {
 chatBubleForFriendItem({super.key,required this.message});
  MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: const BoxDecoration(
          color: Color(0xffAF8F6F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style:const TextStyle(color: kprimaryColor),
        ),
      ),
    );
  }
}