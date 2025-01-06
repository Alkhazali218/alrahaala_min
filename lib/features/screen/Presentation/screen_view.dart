import 'package:alrahaala/features/screen/Presentation/widgets/screen_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class screenView extends StatelessWidget {
  const screenView({super.key});
  static String id = 'screen View';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: screenViewBody(),
    );
  }
}
