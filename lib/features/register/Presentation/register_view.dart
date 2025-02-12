import 'package:alrahaala/features/register/Presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register View';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterViewBody(),
    );
  }
}
