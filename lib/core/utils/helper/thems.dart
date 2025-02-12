import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class assets {
  static const klogo = 'assets/images/alrahaala.png';
  static const kLogoUserChat = 'assets/images/Frame.svg';
}

TextStyle googleFont30 = GoogleFonts.notoSansArabic(
  color: kcolor,
);

TextStyle googleFont18 = GoogleFonts.notoSansArabic(
  color: Colors.black45,
);

void showSnackBar(BuildContext context, String message, Color showColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: showColor,
    ),
  );
}
