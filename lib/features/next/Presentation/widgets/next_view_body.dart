import 'dart:math';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/custom_city_drop_down_item.dart';
import 'package:alrahaala/features/next/data/data/cubit/next_cubit.dart';
import 'package:alrahaala/features/next/data/data/cubit/next_state.dart';
import 'package:alrahaala/features/otp/Presentation/otp_view.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NextViewBody extends StatefulWidget {
  const NextViewBody({super.key});

  @override
  State<NextViewBody> createState() => _NextViewBodyState();
}

class _NextViewBodyState extends State<NextViewBody> {
  GlobalKey<FormState> fromKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? selectedCityId; // متغير لحفظ id المدينة

  // الدالة التي سيتم استدعائها عند اختيار المدينة
  void onCitySelected(String cityId) {
    setState(
      () {
        selectedCityId = cityId;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var random = Random();
    int randomNumber = 10000 + random.nextInt(90000);
    String phoneRandom = CacheNetWork.getCacheDaTaInfo(key: 'phone');

    return Form(
      key: fromKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: height * 0.05),
            TextFromFiledItem(
              controller: nameController,
              hintText: 'الاسم المستلم',
              prefixIcon: FontAwesomeIcons.user,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.name,
            ),
            SizedBox(height: height * 0.02),
            TextFromFiledItem(
              controller: phoneController,
              hintText: 'رقم الهاتف المستلم',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            SizedBox(height: height * 0.02),
            CustomCityDropDownItem(
              onCitySelected: onCitySelected,
            ),
            SizedBox(height: height * 0.02),
            TextFromFiledItem(
              controller: amountController,
              hintText: 'القيمة المراد ارسالها',
              prefixIcon: FontAwesomeIcons.dollarSign,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            SizedBox(height: height * 0.035),
            BlocConsumer<NextCubit, NextState>(
              listener: (context, state) {
                if (state is NextSuccess) {
                  Navigator.pushReplacementNamed(context, homeView.id);

                  AnimatedSnackBar.material('تم تحويل المبلغ بنجاح',
                          type: AnimatedSnackBarType.success)
                      .show(context);
                } else if (state is NextFaliures) {
                  AnimatedSnackBar.material(
                    state.message,
                    type: AnimatedSnackBarType.error,
                  ).show(context);
                }
              },
              builder: (context, state) {
                if (state is NextLaoding) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kpColor,
                    ),
                  );
                }
                return Row(
                  children: [
                    CheckItem(
                      onTap: () {
                        if (fromKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpView(
                                phone: phoneRandom,
                                onCodeChanged: (code) {
                                  // حفظ الكود المدخل عند تغييره
                                },
                                onTap: (enteredCode) {
                                  // التحقق من الكود عند النقر
                                  onTap(context, phoneRandom, enteredCode,
                                      randomNumber.toString());
                                },
                              ),
                            ),
                          );
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
                      onTap: () => Navigator.pushNamed(context, homeView.id),
                      textCheckItem: 'الغاء الامر',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleConfirm(BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      // أولاً، تحقق من الحدود قبل إجراء التحويل
      final checkLimitResult = await BlocProvider.of<NextCubit>(context)
          .checkLimit(amount: amountController.text);

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
        revicedPhone: phoneController.text,
        revicedName: nameController.text,
        amount: amountController.text,
        cityId: selectedCityId!,
      );

      // تخزين الوقت الحالي بعد تنفيذ التحويل
      await CacheNetWork.storeLastTransactionTime();
    }
  }

  void onTap(BuildContext context, String phone, String enteredCode,
      String originalCode) {
    if (enteredCode == originalCode) {
      _handleConfirm(context); // إجراء عملية التحويل بعد التحقق من الكود
    } else {
      AnimatedSnackBar.material("الكود غير صحيح",
              type: AnimatedSnackBarType.error)
          .show(context);
    }
  }
}
