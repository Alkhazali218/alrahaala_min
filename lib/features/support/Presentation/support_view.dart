import 'package:alrahaala/features/support/Presentation/widgets/support_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class supportView extends StatelessWidget {
  const supportView({super.key});
  static String id = 'whatsApp View';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: supportViewBody(),
    );
  }
}

