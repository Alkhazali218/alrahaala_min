import 'dart:math';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next%20ex/Presentation/otp/otp_next_ex_view.dart';
import 'package:alrahaala/features/next%20ex/Presentation/widgets/custom_drop_down_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/otp/data/cubit/otp_cubit.dart';
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
  String? selectedDeliveredCurrencyId;
  String? selectedcountryIdTo;
  String? selectedServiceType;

  void onCitySelected(String cityId) {
    setState(() {
      selectedCityId = cityId;
    });
  }

  void onSelectedDeliveredCurrencyId(String deliveredCurrencyId) {
    setState(() {
      selectedDeliveredCurrencyId = deliveredCurrencyId;
    });
  }

  void onSelectedcountryIdTo(String countryIdTo) {
    setState(() {
      selectedcountryIdTo = countryIdTo;
    });
  }

  void onSelectedServiceType(String serviceType) {
    setState(() {
      selectedServiceType = serviceType;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var random = Random();
    int randomNumber = 1000 + random.nextInt(9000);
    String phoneRandom = CacheNetWork.getCacheDaTaInfo(key: 'phone');

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
              ondeliveredCurrencyId: onSelectedDeliveredCurrencyId,
              oncountryIdToId: onSelectedcountryIdTo,
              onserviceType: onSelectedServiceType,
              bankController: bankController,
            ),
            SizedBox(height: height * 0.035),

            // إظهار زر التأكيد والإلغاء بناءً على الحالة
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
              if (state is OtpSuccess) {
                Navigator.pushNamed(
                  context,
                  OtpNexteXView.id,
                  arguments: {
                    "name": nameController.text.toString(),
                    "phone": phoneController.text.toString(),
                    "amount": amountController.text.toString(),
                    "bank": bankController.text.toString(),
                    'selectedCityId': selectedCityId ?? '0',
                    "selectedDeliveredCurrencyId": selectedDeliveredCurrencyId.toString(),
                    "selectedcountryIdTo": selectedcountryIdTo.toString(),
                    "selectedServiceType": selectedServiceType.toString(),
                    'code' : randomNumber.toString(),
                  },
                );
              } else if (state is OtpFaliures) {
                AnimatedSnackBar.material(
                  state.message,
                  type: AnimatedSnackBarType.error,
                ).show(context);
              }
            }, builder: (context, state) {
              if (state is OtpLoading) {
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
            }),
          ],
        ),
      ),
    );
  }
}



