import 'package:alrahaala/features/foreign%20exchange/Presentation/foreign_exchange_view.dart';
import 'package:alrahaala/features/next%20ex/Presentation/next_ex_view.dart';
import 'package:alrahaala/features/next/Presentation/next_view.dart';
import 'package:alrahaala/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StackUserViewBasicBody extends StatelessWidget {
  const StackUserViewBasicBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: height * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              stackItemSupport(
                onTap: () => Navigator.pushNamed(context, NextExView.id),
                textSupport: 'حوالة خارجية',
                iconSupport: FontAwesomeIcons.moneyBillTransfer,
              ),
              stackItemSupport(
                onTap: () => Navigator.pushNamed(context, nextView.id),
                textSupport: 'حوالة داخلية',
                iconSupport: FontAwesomeIcons.moneyBillTransfer,
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          stackItemSupport(
            textSupport: 'اداع النقد الاجنبي',
            iconSupport: FontAwesomeIcons.dollarSign,
            onTap: () {
              Navigator.pushNamed(context, ForeignExchangeView.id);
            },
          ),
        ],
      ),
    );
  }
}
