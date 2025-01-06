import 'package:alrahaala/features/register/Presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class registerView extends StatelessWidget {
  const registerView({super.key});
static String id = 'register View';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: registerViewBody(),
   );
  }
}