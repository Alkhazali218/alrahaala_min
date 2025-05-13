import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/insert/cubit/insert_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class CustomOtpNextExTextItem extends StatefulWidget {
  final String code;
  final String nameController;
  final String phoneController;
  final String amountController;
  final String bankController;
  final String selectedCityId;
  final String selectedDeliveredCurrencyId;
  final String selectedcountryIdTo;
  final String selectedServiceType;
  const CustomOtpNextExTextItem({
    super.key,
    required this.code,
    required this.nameController,
    required this.amountController,
    required this.bankController,
    required this.phoneController,
    required this.selectedCityId,
    required this.selectedDeliveredCurrencyId,
    required this.selectedServiceType,
    required this.selectedcountryIdTo,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomOtpNextExTextItemState createState() =>
      _CustomOtpNextExTextItemState();
}

class _CustomOtpNextExTextItemState extends State<CustomOtpNextExTextItem> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController pinController; // تغيير إلى late

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String phone = CacheNetWork.getCacheDaTaInfo(key: 'phone');
    const focusedBorderColor = kpColor;
    const fillColor = kprimaryColor;
    const borderColor = kpColor;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            Text(
              'ادخل كود التحقق',
              textAlign: TextAlign.center,
              style: googleFont30.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 30),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              // ignore: unnecessary_brace_in_string_interps
              'تم ارسال رمز التحقق الى رقم الهاتف التالي ${phone}', // استخدام widget.phone
              textAlign: TextAlign.center,
              style: googleFont18.copyWith(
                fontSize: getRsonsiveFontSize(context, fontSize: 12),
              ),
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: pinController,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == widget.code ? null : 'الكود غير صحيح';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: kpColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<InsertCubit, InsertState>(
              listener: (context, state) {
                if (state is InsertSuccess) {
                  
                  Navigator.pushReplacementNamed(context, homeView.id);
                  AnimatedSnackBar.material('تم تحويل بنجاح',
                          type: AnimatedSnackBarType.success)
                      .show(context);
                } else if (state is InsertFaliures) {
                  
                  AnimatedSnackBar.material(state.message,
                          type: AnimatedSnackBarType.error)
                      .show(context);
                }
              },
              builder: (context, state) {
                if (state is InsertLoading) {
                  return const CustomCircular();
                }
                return ButtonItem(
                  textButton: 'التحقق',
                  onTap: () async {
                    if (pinController.text == widget.code) {
                     
                      await _handleConfirm(context);
                    } else {
                      AnimatedSnackBar.material('الكود غير صحيح',
                              type: AnimatedSnackBarType.error)
                          .show(context);
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleConfirm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      // أولاً، تحقق من الحدود قبل إجراء التحويل
      final checkLimitResult = await BlocProvider.of<InsertCubit>(context)
          .checkLimit(amount: widget.amountController);

      if (checkLimitResult != null && checkLimitResult is InsertFaliures) {
        AnimatedSnackBar.material(
          checkLimitResult.message,
          type: AnimatedSnackBarType.error,
        ).show(context);
        return;
      }

      // التحقق من مرور 6 دقائق من آخر تحويل
      bool canProceed = await CacheNetWork.canProceedWithTransaction();

      if (!canProceed) {
        AnimatedSnackBar.material(
          "يجب أن تنتظر 6 دقائق قبل إجراء التحويل التالي.",
          type: AnimatedSnackBarType.error,
        ).show(context);
        return;
      }
      // بعد التحقق من كل شيء، قم بتنفيذ عملية التحويل
      await BlocProvider.of<InsertCubit>(context).featchInsert(
        recievedName: widget.nameController,
        rPhone1: widget.phoneController,
        cityIdTo: widget.selectedCityId.isEmpty ? '0' : widget.selectedCityId,
        deliveredCurrencyId: widget.selectedDeliveredCurrencyId,
        countryIdTo: widget.selectedcountryIdTo,
        serviceType: widget.selectedServiceType,
        currRecievedVal: widget.amountController,
        ownAccNo:
            widget.bankController.isEmpty ? 'Null' : widget.bankController,
      );

      // تخزين الوقت الحالي بعد تنفيذ التحويل
      await CacheNetWork.storeLastTransactionTime();
    }
  }
}
