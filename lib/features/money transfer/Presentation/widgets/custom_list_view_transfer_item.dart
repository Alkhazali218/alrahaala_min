import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_money_transfer.dart';
import 'package:flutter/material.dart';

class CustomListViewTransferItem extends StatelessWidget {
  const CustomListViewTransferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const CustomMoneyTransfer();
      },
    );
  }
}
