import 'dart:math';

import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/otp/otp_transfer_view.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_state.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTransferUserItem extends StatelessWidget {
  CustomTransferUserItem({super.key});
  static String id = 'CustomTransferUserItem';
  // فرضنا أن البيانات سيتم تمريرها عبر المعاملات
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController accountController = TextEditingController();

  final TextEditingController branchController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
  String? accIdTo;

  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var random = Random();
    int randomNumber = 1000 + random.nextInt(9000);
    String phoneRandom = CacheNetWork.getCacheDaTaInfo(key: 'phone');
    var accCode = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'عملية تحويل الفوري',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: Form(
        key: fromKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: height * 0.040),
              BlocBuilder<TransferCubit, TransferState>(
                builder: (context, state) {
                  if (state is TransferSucces) {
                    // هنا يتم عرض البيانات بعد جلبها من API
                    final data = state.transfer
                        .firstWhere((item) => item.accCode == accCode);

                    nameController.text = data.accName;
                    phoneController.text = data.accPhone;
                    accountController.text = data.accCode;
                    branchController.text = data.bName;
                    accIdTo = data.accId;

                    return Column(
                      children: [
                        TextFromFiledItem(
                          hintText: 'اسم الحساب',
                          prefixIcon: FontAwesomeIcons.user,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: nameController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.020),
                        TextFromFiledItem(
                          hintText: 'رقم الهاتف',
                          prefixIcon: FontAwesomeIcons.hashtag,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: phoneController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.020),
                        TextFromFiledItem(
                          hintText: 'رقم الحساب',
                          prefixIcon: FontAwesomeIcons.hashtag,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: accountController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.020),
                        TextFromFiledItem(
                          hintText: 'الفرع',
                          prefixIcon: FontAwesomeIcons.locationCrosshairs,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: branchController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.020),
                        TextFromFiledItem(
                          hintText: 'القيمة',
                          prefixIcon: FontAwesomeIcons.moneyBill1,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.number,
                          controller: amountController,
                          readOnly: false, // لجعل الحقل غير قابل للتحرير
                        ),
                      ],
                    );
                  } else if (state is TransferFaliures) {
                    return Center(
                      child: Text(
                        state.message,
                        style: googleFont30.copyWith(
                          fontSize: getRsonsiveFontSize(context, fontSize: 28),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: kpColor));
                  }
                },
              ),
              SizedBox(height: height * 0.035),
              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  if (state is OtpSuccess) {
                    Navigator.pushNamed(
                      context,
                      OtpTransferView.id,
                      arguments: {
                        'amount': amountController.text.toString(),
                        'accidTo': accIdTo.toString(),
                        'code': randomNumber.toString(),
                      },
                    );
                  } else if (state is OtpFaliures) {
                    AnimatedSnackBar.material(
                      state.message,
                      type: AnimatedSnackBarType.error,
                    ).show(context);
                  }
                },
                builder: (context, state) {
                  return state is OtpLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: kpColor))
                      : Row(
                          children: [
                            CheckItem(
                              onTap: () {
                                if (fromKey.currentState!.validate()) {
                                  BlocProvider.of<OtpCubit>(context).featchOtp(
                                    phone: phoneRandom,
                                    message:
                                        'كود التحقق الخاص بكَ\n${randomNumber.toString()}\nلا تطلع أحداً عليه',
                                  );
                                }
                              },
                              textCheckItem: 'تاكيد',
                            ),
                            SizedBox(width: width * 0.020),
                            CheckItem(
                              onTap: () =>
                                  Navigator.pushNamed(context, homeView.id),
                              textCheckItem: 'الغاء الامر',
                            ),
                          ],
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
