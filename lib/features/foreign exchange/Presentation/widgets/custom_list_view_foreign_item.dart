import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/foreign%20exchange/Presentation/widgets/navigator_foreign_item.dart';
import 'package:alrahaala/features/foreign%20exchange/data/data/cubit/deposit_cubit.dart';
import 'package:alrahaala/features/foreign%20exchange/data/model/forgien_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListViewForeignItem extends StatelessWidget {
  final DataForgienModel data;

  const CustomListViewForeignItem(
      {super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<DepositCubit>(context).getDeposit(currencyId: data.currencyID);
        Navigator.pushNamed(context, NavigatorForeignItem.id,arguments: data.cuName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: height * 0.09,
          decoration: BoxDecoration(
            border: Border.all(
              color: kcolor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  data.walet + data.curCode,
                  style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                SizedBox(width: width * 0.030),
                Text(
                  data.cuName,
                  style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(context, fontSize: 18),
                  ),
                ),
                SizedBox(width: width * 0.030),
                const Icon(
                  FontAwesomeIcons.wallet,
                  color: kpColor,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
