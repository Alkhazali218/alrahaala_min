import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/custom_list_view_foreign_item.dart';
import 'package:flutter/material.dart';

class ForeignExchangeViewBody extends StatelessWidget {
  const ForeignExchangeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const CustomListViewForeignItem();
      },
    );
  }
}
