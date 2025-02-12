import 'package:alrahaala/features/account%20statement/Presentation/account_statement_view.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/money_transfer_view.dart';
import 'package:alrahaala/features/support/Presentation/widgets/stack_item_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRowStack extends StatelessWidget {
  const CustomRowStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        stackItemSupport(
          onTap: () => Navigator.pushNamed(context, MoneyTransferView.id),
          textSupport: 'تحويل الاموال',
          iconSupport: FontAwesomeIcons.rightLeft,
        ),
        stackItemSupport(
          onTap: () => Navigator.pushNamed(context, AccountStatementView.id),
          textSupport: 'كشف الحساب',
          iconSupport: FontAwesomeIcons.list,
        ),
      ],
    );
  }
}
