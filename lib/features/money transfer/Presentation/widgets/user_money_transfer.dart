import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_transfer_user_item.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_state.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserMoneyTransfer extends StatelessWidget {
  UserMoneyTransfer({super.key});

  static String id = 'UserMoneyTransfer';

  final moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تحويل الاموال',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            TextFromFiledItem(
              controller: moneyController,
              hintText: 'رقم حساب المستلم',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            SizedBox(height: height * 0.035),
            BlocConsumer<TransferCubit, TransferState>(
              listener: (context, state) {
                if (state is TransferSucces) {
                  Navigator.pushReplacementNamed(
                      context, CustomTransferUserItem.id,
                      arguments: moneyController.text);
                } else if (state is TransferFaliures) {
                  AnimatedSnackBar.material(state.message,
                          type: AnimatedSnackBarType.error)
                      .show(context);
                }
              },
              builder: (context, state) {
                return state is TransferLoading
                    ? const CustomCircular()
                    : ButtonItem(
                        textButton: 'تحويل',
                        onTap: () {
                          // ارسال رقم الحساب والمبلغ للحصول على البيانات من الـ API
                          BlocProvider.of<TransferCubit>(context)
                              .featchTransfer(accCode: moneyController.text);
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
