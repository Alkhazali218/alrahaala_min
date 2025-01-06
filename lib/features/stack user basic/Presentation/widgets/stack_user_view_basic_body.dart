import 'package:alrahaala/features/next%20ex/Presentation/next_ex_view.dart';
import 'package:alrahaala/features/next/Presentation/next_view.dart';
import 'package:alrahaala/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StackUserViewBasicBody extends StatelessWidget {
  const StackUserViewBasicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       const SizedBox(height: 60),
        Padding(
          padding:const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stackItemSupport(
                onTap: () => Navigator.pushNamed(context,NextExView.id),
                textSupport: 'حوالة خارجية',
                iconSupport: FontAwesomeIcons.moneyBillTransfer,
              ),
              stackItemSupport(
                onTap: () => Navigator.pushNamed(context,nextView.id),
                textSupport: 'حوالة داخلية',
                iconSupport: FontAwesomeIcons.moneyBillTransfer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}