import 'package:alrahaala/features/user/Presentation/widgets/user_view_body.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class userView extends StatelessWidget {
  const userView({super.key});
  static String id = 'user View';
  @override
  Widget build(BuildContext context) {
 return const Scaffold(
  body: userViewBody(),
 );
  }
}