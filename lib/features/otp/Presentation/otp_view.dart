import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/otp/Presentation/widgets/custom_otp_text_item.dart';
import 'package:flutter/material.dart';

class OtpView extends StatefulWidget {
  final String phone;
  final Function(String) onCodeChanged;
  final Function(String) onTap; // Pass the entered code to onTap

  const OtpView({super.key, required this.phone, required this.onCodeChanged, required this.onTap});

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String enteredCode = ''; // Store the entered OTP code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kpColor,
        forceMaterialTransparency: true,
        primary: true,
      ),
      body: CustomOtpTextItem(
        onCodeChanged: (code) {
          setState(() {
            enteredCode = code; // Save the entered code
          });
          widget.onCodeChanged(code); // Pass the code to the external function
        },
        onTap: () {
          widget.onTap(enteredCode); // Pass the entered code to the verification function
        },
      ),
    );
  }
}



