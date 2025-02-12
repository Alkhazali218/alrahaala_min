import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_list_view_transfer_item.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/money_transfer_item.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/search_text_filed.dart';
import 'package:flutter/material.dart';

class MoneyTransferViewBody extends StatelessWidget {
  const MoneyTransferViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: height * 0.030),
            SearchTextFiled(onChanged: (value) {}),
            SizedBox(height: height * 0.030),
            const Expanded(
              child: CustomListViewTransferItem(),
            ),
          ],
        ),
        const Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: moneyTransferItem(
              text: 'تحويل القيمة',
            ),
          ),
        ),
      ],
    );
  }
}
