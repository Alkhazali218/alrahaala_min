import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next%20ex/Presentation/widgets/custom_drop_down_item.dart';
import 'package:alrahaala/features/next%20ex/data/cubits/insert/cubit/insert_cubit.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NextExViewBody extends StatefulWidget {
  const NextExViewBody({super.key});

  @override
  State<NextExViewBody> createState() => _NextExViewBodyState();
}

class _NextExViewBodyState extends State<NextExViewBody> {
  GlobalKey<FormState> fromKey = GlobalKey();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final amountController = TextEditingController();
  final bankController = TextEditingController();
  String? selectedCityId;
  String? deliveredCurrencyId;
  String? countryIdTo;
  String? serviceTypeId; // سيتم تحديثها من داخل CustomDropDownItem
  String? selectedServiceSrid; // سيتم تخزين srId هنا

  void onCitySelected(String cityId) {
    setState(() {
      selectedServiceSrid = cityId;
    });
  }

  void onServiceIdSelected(String serviceId) {
    setState(() {
      selectedCityId = serviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Form(
      key: fromKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            // اسم المستلم
            TextFromFiledItem(
              controller: nameController,
              hintText: 'الاسم المستلم',
              prefixIcon: FontAwesomeIcons.user,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.name,
            ),
            SizedBox(height: height * 0.02),

            // رقم الهاتف المستلم
            TextFromFiledItem(
              controller: phoneController,
              hintText: 'رقم الهاتف المستلم',
              prefixIcon: FontAwesomeIcons.hashtag,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            SizedBox(height: height * 0.02),

            // القيمة المراد ارسالها
            TextFromFiledItem(
              controller: amountController,
              hintText: 'القيمة المراد ارسالها',
              prefixIcon: FontAwesomeIcons.dollarSign,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.number,
            ),
            SizedBox(height: height * 0.02),

            // CustomDropDownItem يتم تمرير قيمة serviceType هنا
            CustomDropDownItem(
              onCitySelected: onCitySelected,
              bankController: bankController,
              deliveredCurrencyId: deliveredCurrencyId,
              countryIdTo: countryIdTo,
              onServiceIdSelected: onCitySelected,
            ),
            SizedBox(height: height * 0.035),

            // إظهار زر التأكيد والإلغاء بناءً على الحالة
            BlocConsumer<InsertCubit, InsertState>(
              listener: (context, state) {
                if (state is InsertSuccess) {
                  Navigator.pushNamed(context, homeView.id);
                  AnimatedSnackBar.material(
                    'تم تحويل بنجاح',
                    type: AnimatedSnackBarType.success,
                  ).show(context);
                } else if (state is InsertFaliures) {
                  AnimatedSnackBar.material(
                    state.message,
                    type: AnimatedSnackBarType.error,
                  ).show(context);
                }
              },
              builder: (context, state) {
                if (state is InsertLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kpColor,
                    ),
                  );
                }
                return Row(
                  children: [
                    CheckItem(
                      onTap: () => _handleConfirm(context),
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

  // دالة handleConfirm التي ستتعامل مع التأكيد
  Future<void> _handleConfirm(BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      // أولاً، تحقق من الحدود قبل إجراء التحويل
      final checkLimitResult = await BlocProvider.of<InsertCubit>(context)
          .checkLimit(amount: amountController.text);

      if (checkLimitResult != null && checkLimitResult is InsertFaliures) {
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
          "يجب أن تنتظر 6 دقائق قبل إجراء التحويل التالي",
          type: AnimatedSnackBarType.error,
        // ignore: use_build_context_synchronously
        ).show(context);
        return;
      }

      // تنفيذ عملية الإدخال
      // ignore: use_build_context_synchronously
      await BlocProvider.of<InsertCubit>(context).featchInsert(
        recievedName: nameController.text,
        rPhone1: phoneController.text,
        cityIdTo: selectedCityId ?? '0',
        deliveredCurrencyId: deliveredCurrencyId ?? '0',
        countryIdTo: countryIdTo ?? '0',
        serviceType: '3',
        currRecievedVal: amountController.text,
        ownAccNo: bankController.text ?? 'Null',
      );

      // تخزين الوقت الحالي بعد تنفيذ التحويل
      await CacheNetWork.storeLastTransactionTime();
    }
  }
}

