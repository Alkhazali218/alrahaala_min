import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/user/Presentation/widgets/text_item.dart';
import 'package:alrahaala/features/user/data/cubit/user_cubit.dart';
import 'package:alrahaala/features/user/data/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class CloumItemUser extends StatelessWidget {
  const CloumItemUser({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    String accName = CacheNetWork.getCacheDaTaInfo(key: 'AccName');
    String bName = CacheNetWork.getCacheDaTaInfo(key: 'BName');
    String accCode = CacheNetWork.getCacheDaTaInfo(key: 'AccCode');
    String phone = CacheNetWork.getCacheDaTaInfo(key: 'phone');
    String curCode = CacheNetWork.getCacheDaTaInfo(key: 'curCode');

    if (accName.startsWith("حساب ")) {
      accName = accName.substring(5);
    }

    return Column(
      children: [
        SizedBox(height: height * 0.04),
        Text(
          text,
          style: googleFont30.copyWith(
            color: Colors.black87,
            fontSize: getRsonsiveFontSize(
              context,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: height * 0.010),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return Text(
                // ignore: unnecessary_brace_in_string_interps
                '${NumberFormat('#,###.###').format(double.tryParse(state.user.firstOrNull!) ?? 0)} ${curCode}',
                style: googleFont30.copyWith(
                  color: kpColor,
                  fontSize: getRsonsiveFontSize(context, fontSize: 28),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: kpColor,
                  strokeWidth: 1,
                ),
              );
            }
          },
        ),
        SizedBox(height: height * 0.005),
        TextItem(
          textItemOne: accCode,
          textitemTwo: 'رقم الحساب',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        TextItem(
          textItemOne: phone,
          textitemTwo: 'رقم الهاتف',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        TextItem(
          textItemOne: accName,
          textitemTwo: 'الاسم',
        ),
        const Divider(
          color: colorStack,
          thickness: 0.6,
          indent: 18,
          endIndent: 18,
        ),
        TextItem(
          textItemOne: bName,
          textitemTwo: 'الفرع',
        ),
      ],
    );
  }
}
