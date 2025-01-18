import 'package:alrahaala/features/chat/Presentation/chat_view.dart';
import 'package:alrahaala/features/stack%20user%20star/Presentation/widgets/custom_row_stack.dart';
import 'package:alrahaala/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCloumItem extends StatelessWidget {
  const CustomCloumItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomRowStack(),
          const SizedBox(height: 20),
          stackItemSupport(
            onTap: () => Navigator.pushNamed(context, chatView.id),
            textSupport: 'دردشة المستخدمين',
            iconSupport: FontAwesomeIcons.comments,
          ),
        ],
      ),
    );
  }
}