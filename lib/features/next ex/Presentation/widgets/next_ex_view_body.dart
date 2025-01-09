import 'package:alrahaala/features/home/Presentation/home_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/next/Presentation/widgets/check_item.dart';
import 'package:alrahaala/features/stack%20user%20basic/Presentation/stack_user_view_basic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class NextExViewBody extends StatelessWidget {
const NextExViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(height: 60),
          textFromFiledItem(
             onChanged: (p0) {
              
            },
            hintText: 'الاسم المستلم',
            prefixIcon: FontAwesomeIcons.user,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 15),
          textFromFiledItem(
            onChanged: (p0) {
              
            },
            hintText: 'رقم الهاتف المستلم',
            prefixIcon: FontAwesomeIcons.hashtag,
            pass: false,
            isSecurePassword: false,
          ),
          
          const SizedBox(height: 15),
          textFromFiledItem(
             onChanged: (p0) {
              
            },
            hintText: 'المدينة',
            prefixIcon: FontAwesomeIcons.treeCity,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 15),
          
           textFromFiledItem(
             onChanged: (p0) {
              
            },
            hintText: 'الدولة',
            prefixIcon: FontAwesomeIcons.earthAfrica,
            pass: false,
            isSecurePassword: false,
          ),
          const SizedBox(height: 15),
          textFromFiledItem(
            onChanged: (p0) {
              
            },
            hintText: 'القيمة المراد ارسالها',
            prefixIcon: FontAwesomeIcons.dollarSign,
            pass: false,
            isSecurePassword: false,
          ),
           const SizedBox(height: 15),
          textFromFiledItem(
             onChanged: (p0) {
              
            },
            hintText: 'العملة',
            prefixIcon: FontAwesomeIcons.dollarSign,
            pass: false,
            isSecurePassword: false,
          ),
         
          const SizedBox(height: 20),
           Row(
            children: [
              CheckItem(
                onTap: () => Navigator.pushNamed(context,StackUserViewBasic.id),
                textCheckItem: 'تاكيد',
              ),
              const SizedBox(width: 10),
              CheckItem(
                onTap: () => Navigator.pushNamed(context,homeView.id),
                textCheckItem: 'الغاء الامر',
              ),
            ],
          )
        ],
      ),
    );
  }
}