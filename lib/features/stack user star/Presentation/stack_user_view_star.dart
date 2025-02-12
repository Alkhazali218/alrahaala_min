import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/stack%20user%20star/Presentation/widgets/stack_user_view_star_body.dart';
import 'package:flutter/material.dart';

class StackUserViewStar extends StatelessWidget {
  const StackUserViewStar({super.key});
  static String id = 'stack User  View Star';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const StackUserViewStarBody(),
    );
  }
}
