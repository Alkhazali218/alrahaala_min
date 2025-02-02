import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NextExViewBody extends StatelessWidget {
 NextExViewBody({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(height: 40),
          textFromFiledItem(
           controller: controller,
            hintText: 'الاسم المستلم',
            prefixIcon: FontAwesomeIcons.user,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.name,
          ),
           SizedBox(height: height * 0.02),
          textFromFiledItem(
           controller: controller,
            hintText: 'رقم الهاتف المستلم',
            prefixIcon: FontAwesomeIcons.hashtag,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.number,
          ),
           SizedBox(height: height * 0.02),
          textFromFiledItem(
            controller: controller,
            hintText: 'الدولة',
            prefixIcon: FontAwesomeIcons.earthAfrica,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.name,
          ),
           SizedBox(height: height * 0.02),
          textFromFiledItem(
            controller: controller,
            hintText: 'المدينة',
            prefixIcon: FontAwesomeIcons.treeCity,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.name,
          ),
          SizedBox(height: height * 0.02),
          textFromFiledItem(
            controller: controller,
            hintText: 'العملة',
            prefixIcon: FontAwesomeIcons.dollarSign,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.name,
          ),
           SizedBox(height: height * 0.02),
          textFromFiledItem(
            controller: controller,
            hintText: 'القيمة المراد ارسالها',
            prefixIcon: FontAwesomeIcons.dollarSign,
            pass: false,
            isSecurePassword: false,
            textType: TextInputType.number,
          ),
          SizedBox(height: height * 0.035),
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
