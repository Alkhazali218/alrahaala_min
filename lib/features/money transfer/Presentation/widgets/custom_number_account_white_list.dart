import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_transfer_user_add_white_list_item.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_state.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNumberAcountWhiteList extends StatelessWidget {
  CustomNumberAcountWhiteList({super.key});
  final TextEditingController accIdController = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: fromKey,
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            TextFromFiledItem(
              validator: (value) =>
                  value!.isEmpty ? 'الرجاء ادخال رقم الحساب' : null,
              controller: accIdController,
              hintText: 'رقم الحساب',
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
                      context, CustomTransferUserAddWhileListItem.id,
                      arguments: accIdController.text);
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
                        textButton: 'اضافة',
                        onTap: () {
                          if (fromKey.currentState!.validate()) {
                            BlocProvider.of<TransferCubit>(context)
                                .featchTransfer(accCode: accIdController.text);
                          }
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}