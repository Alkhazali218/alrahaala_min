import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/custom_city_drop_down_item.dart';
import 'package:alrahaala/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NextViewBody extends StatefulWidget {
  const NextViewBody({super.key});

  @override
  State<NextViewBody> createState() => _NextViewBodyState();
}

class _NextViewBodyState extends State<NextViewBody> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(height: height * 0.05),

          // حقل النص الخاص بالاسم المستلم
          textFromFiledItem(
            controller: controller,
            hintText: 'الاسم المستلم',
            prefixIcon: FontAwesomeIcons.user,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.name,
          ),
          SizedBox(height: height * 0.02),
          // حقل النص الخاص برقم الهاتف المستلم
          textFromFiledItem(
            controller: controller,
            hintText: 'رقم الهاتف المستلم',
            prefixIcon: FontAwesomeIcons.hashtag,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.number,
          ),
          SizedBox(height: height * 0.02),
          // Dropdown للمدينة
          CustomCityDropDownItem(),
          SizedBox(height: height * 0.02),
          // حقل النص الخاص بالقيمة المراد ارسالها
          textFromFiledItem(
            controller: controller,
            hintText: 'القيمة المراد ارسالها',
            prefixIcon: FontAwesomeIcons.dollarSign,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.number,
          ),
          SizedBox(height: height * 0.035),

          // صف من الأزرار
          Row(
            children: [
              CheckItem(
                onTap: () =>
                    Navigator.pushNamed(context, StackUserViewBasic.id),
                textCheckItem: 'تاكيد',
              ),
              SizedBox(width: width * 0.020),
              CheckItem(
                onTap: () => Navigator.pushNamed(context, homeView.id),
                textCheckItem: 'الغاء الامر',
              ),
            ],
          )
        ],
      ),
    );
  }
}
