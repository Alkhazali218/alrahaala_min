import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

class TextFieldChat extends StatelessWidget {
  const TextFieldChat({super.key, required this.controller, required this.onTap});

  final TextEditingController controller;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Send Message',
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.send,
              color: kcolor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kcolor,
            ),
          ),
        ),
      ),
    );
  }
}

