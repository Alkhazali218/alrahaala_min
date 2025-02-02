import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class textFromFiledItem extends StatefulWidget {
  textFromFiledItem({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.pass,
    required this.isSecurePassword,
    required this.textType, required this.controller,
    
  });
  final String hintText;
  final IconData prefixIcon;
  final bool pass;
  bool isSecurePassword;
  final TextInputType textType;
  final TextEditingController controller;
  

  @override
  State<StatefulWidget> createState() {
    return _textFromFiledItemState();
  }
}

// ignore: camel_case_types
class _textFromFiledItemState extends State<textFromFiledItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "رجاءً إدخال البيانات بطريقة صحيحة";
          }
          return null;
        },
        keyboardType: widget.textType,
        controller: widget.controller,
        textAlign: TextAlign.right,
        obscureText: widget.isSecurePassword,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: const TextStyle(color: kcolor),
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon, color: kpColor),
          suffixIcon: widget.pass ? togglePassword() : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: kcolor),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.isSecurePassword = !widget.isSecurePassword;
        });
      },
      icon: widget.isSecurePassword
          ? const Icon(
              Icons.visibility_off,
              color: kpColor,
            )
          : const Icon(
              Icons.visibility,
              color: kpColor,
            ),
    );
  }
}
