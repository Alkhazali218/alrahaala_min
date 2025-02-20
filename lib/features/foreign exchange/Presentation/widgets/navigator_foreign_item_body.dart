import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/custom_Aspect_foreign_item.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/cubit/deposit_cubit.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/cubit/deposit_state.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorForeignItemBody extends StatelessWidget {
  NavigatorForeignItemBody({super.key});

  List<DataDepositModel> deposit = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositCubit, DepositState>(
      builder: (context, state) {
        if (state is DepositSuccess) {
          deposit = state.deposit;
          return ListView.builder(
            itemCount: deposit.length,
            itemBuilder: (context, index) {
              return CustomAspectForeginItem(dataDepositModel: deposit[index]);
            },
          );
        } else if (state is DepositFaliures) {
          return Center(
            child: Text(
              state.message,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 28),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator(color: kpColor));
        }
      },
    );
  }
}
