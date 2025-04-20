import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/button_item.dart';
import 'package:alrahaala/features/login/Presentation/widgets/custom_circular.dart';
import 'package:alrahaala/features/next/data/data/cubit/next_cubit.dart';
import 'package:alrahaala/features/next/data/data/cubit/next_state.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class CustomOtpNextTextItem extends StatefulWidget {
  final String code;
  final String phone;
  final String name;
  final String amount;
  final String cityId;
  const CustomOtpNextTextItem(
      {super.key,
      required this.code,
      required this.phone,
      required this.name,
      required this.amount,
      required this.cityId});

  @override
  _CustomOtpNextTextItemState createState() => _CustomOtpNextTextItemState();
}

class _CustomOtpNextTextItemState extends State<CustomOtpNextTextItem> {
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
            BlocConsumer<NextCubit, NextState>(
              listener: (context, state) {
                if (state is NextSuccess) {
                  Navigator.pushNamed(context, homeView.id);
                  AnimatedSnackBar.material('تم تحويل بنجاح',
                          type: AnimatedSnackBarType.success)
                      .show(context);
                } else if (state is NextFaliures) {
                  AnimatedSnackBar.material(state.message,
                          type: AnimatedSnackBarType.error)
                      .show(context);
                }
              },
              builder: (context, state) {
                if (state is NextLaoding) {
                  return const CustomCircular();
                }
                return ButtonItem(
                  textButton: 'التحقق',
                  onTap: () {
                    if (pinController.text == widget.code) {
                      _handleConfirm(context);
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
      final checkLimitResult = await BlocProvider.of<NextCubit>(context)
          .checkLimit(amount: widget.amount);

      if (checkLimitResult != null && checkLimitResult is NextFaliures) {
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
      await BlocProvider.of<NextCubit>(context).transferNext(
        revicedPhone: widget.phone,
        revicedName: widget.name,
        amount: widget.amount,
        cityId: widget.cityId,
      );

      // تخزين الوقت الحالي بعد تنفيذ التحويل
      await CacheNetWork.storeLastTransactionTime();
    }
  }
}
