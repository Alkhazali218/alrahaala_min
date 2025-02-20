import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/cubit/transfer_state.dart';
import 'package:alrahaala/features/money%20transfer/data/data_transfer/cubit/transfer_account_cubit.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
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

    // جلب رقم الحساب من المعاملات
    final String accCode = ModalRoute.of(context)!.settings.arguments as String;

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
                        SizedBox(height: height * 0.012),
                        TextFromFiledItem(
                          hintText: 'رقم الهاتف',
                          prefixIcon: FontAwesomeIcons.hashtag,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: phoneController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.012),
                        TextFromFiledItem(
                          hintText: 'رقم الحساب',
                          prefixIcon: FontAwesomeIcons.hashtag,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: accountController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.012),
                        TextFromFiledItem(
                          hintText: 'الفرع',
                          prefixIcon: FontAwesomeIcons.locationCrosshairs,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: branchController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                        ),
                        SizedBox(height: height * 0.012),
                        TextFromFiledItem(
                          hintText: 'القيمة المراد ارسالها',
                          prefixIcon: FontAwesomeIcons.moneyBill,
                          pass: false,
                          isSecurePassword: false,
                          textType: TextInputType.text,
                          controller: amountController,
                          readOnly: false,
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
              BlocConsumer<TransferAccountCubit, TransferAccountState>(
                listener: (context, state) {
                  if (state is TransferAccountSuccess) {
                    Navigator.pushNamed(context, homeView.id);
                    AnimatedSnackBar.material(
                      'تم تحويل بنجاح',
                      type: AnimatedSnackBarType.success,
                    ).show(context);
                  } else if (state is TransferAccountFaliures) {
                    AnimatedSnackBar.material(
                      state.message,
                      type: AnimatedSnackBarType.error,
                    ).show(context);
                  }
                },
                builder: (context, state) {
                  return state is TransferAccountLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: kpColor))
                      : Row(
                          children: [
                            CheckItem(
                              onTap: ()=> _handleConfirm(context),
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

  Future<void> _handleConfirm(BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      // أولاً، تحقق من الحدود قبل إجراء التحويل
      final checkLimitResult =
          await BlocProvider.of<TransferAccountCubit>(context)
              .checkLimit(amount: amountController.text);

      if (checkLimitResult != null &&
          checkLimitResult is TransferAccountFaliures) {
        AnimatedSnackBar.material(
          checkLimitResult.message,
          type: AnimatedSnackBarType.error,
          // ignore: use_build_context_synchronously
        ).show(context);
        return;
      }

      // التحقق من مرور 6 دقائق من آخر تحويل
      bool canProceed = await CacheNetWork.canProceedWithTransaction();

      if (!canProceed) {
        AnimatedSnackBar.material(
          "يجب أن تنتظر 6 دقائق قبل إجراء التحويل التالي.",
          type: AnimatedSnackBarType.error,
          // ignore: use_build_context_synchronously
        ).show(context);
        return;
      }

      // بعد التحقق من كل شيء، قم بتنفيذ عملية التحويل
      // ignore: use_build_context_synchronously
      await BlocProvider.of<TransferAccountCubit>(context)
          .transferAccount(accIdTo: accIdTo!, amount: amountController.text);

      // تخزين الوقت الحالي بعد تنفيذ التحويل
      await CacheNetWork.storeLastTransactionTime();
    }
  }
}
