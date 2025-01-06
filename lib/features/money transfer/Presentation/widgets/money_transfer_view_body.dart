import 'package:alrahaala/features/money%20transfer/Presentation/widgets/money_transfer_item.dart';
import 'package:flutter/material.dart';

class MoneyTransferViewBody extends StatelessWidget {
  const MoneyTransferViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        moneyTransferItem(
          text: 'تحويل القيمة',
          onTap: () {},
        ),
      ],
    );
  }
}
