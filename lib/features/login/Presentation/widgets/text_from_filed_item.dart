import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';

class TextFromFiledItem extends StatefulWidget {
  TextFromFiledItem({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.pass,
    required this.isSecurePassword,
    required this.textType,
    required this.controller,
    this.validator, // إضافة الـ validator كـ parameter
    this.onChanged, // إضافة onChanged لتحديث الحالة
    this.readOnly = false, // إضافة خاصية readOnly
  });

  final String hintText;
  final IconData prefixIcon;
  final bool pass;
  bool isSecurePassword;
  final TextInputType textType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator; // الـ validator هنا
  final ValueChanged<String>? onChanged; // onChanged إذا أردت مراقبة التغيير في النص
  final bool readOnly; // خاصية readOnly لتمكين أو تعطيل التعديل
  

  @override
  State<StatefulWidget> createState() {
    return _TextFromFiledItemState();
  }
}

class _TextFromFiledItemState extends State<TextFromFiledItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (data) {
        if (data!.isEmpty) {
          return 'رجاءا ادخل البيانات ';
        }
        return null;
      },
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
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

