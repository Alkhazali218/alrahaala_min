import 'package:alrahaala/features/login/Presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginView extends StatelessWidget {
  const loginView({super.key});
  static String id = 'login View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
