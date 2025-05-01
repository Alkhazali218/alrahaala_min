import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_state.dart';
import 'package:alrahaala/features/money%20transfer/data/white/cubit/white_cubit.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTransferUserAddWhileListItem extends StatelessWidget {
  CustomTransferUserAddWhileListItem({super.key});
  static String id = 'CustomTransferUserAddWhileListItem';

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
    final String accCode = ModalRoute.of(context)!.settings.arguments as String;
    final String accId = CacheNetWork.getCacheDaTaInfo(key: 'AccID');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'عملية اضافة الى القائمة ',
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
              BlocConsumer<WhiteCubit, WhiteState>(
                listener: (context, state) {
                  if (state is WhiteSuccess) {
                    Navigator.pushReplacementNamed(context, homeView.id);
                    AnimatedSnackBar.material('تمت الاضافة بنجاح',
                            type: AnimatedSnackBarType.success)
                        .show(context);
                  } else if (state is WhiteFaliures) {
                    AnimatedSnackBar.material(state.message,
                            type: AnimatedSnackBarType.error)
                        .show(context);
                  }
                },
                builder: (context, state) {
                  return state is WhiteLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: kpColor))
                      : Row(
                          children: [
                            CheckItem(
                              onTap: () {
                                if (fromKey.currentState!.validate()) {
                                  
                                  BlocProvider.of<WhiteCubit>(context)
                                      .feachWhite(
                                    accId: accId,
                                    accIdTo: accIdTo!,
                                  );
                                }
                              },
                              textCheckItem: 'اضافة',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
