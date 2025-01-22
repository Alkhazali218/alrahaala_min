import 'package:alrahaala/features/stack%20user%20star/Presentation/widgets/custom_row_stack.dart';
import 'package:alrahaala/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:alrahaala/features/user%20chat/Presentation/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCloumItem extends StatelessWidget {
  const CustomCloumItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomRowStack(),
          SizedBox(height: height * 0.03),
          stackItemSupport(
            onTap: () => Navigator.pushNamed(context, UserChat.id),
            textSupport: 'دردشة المستخدمين',
            iconSupport: FontAwesomeIcons.comments,
          ),
        ],
      ),
    );
  }
}