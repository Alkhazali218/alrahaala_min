import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class chatBubleItem extends StatelessWidget {
  const chatBubleItem({super.key,required this.message});

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: const BoxDecoration(
          color: kcolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
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