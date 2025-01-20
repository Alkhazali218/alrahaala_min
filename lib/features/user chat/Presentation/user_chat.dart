import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/Presentation/chat_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserChat extends StatelessWidget {
  const UserChat({super.key});

  static String id = 'UserChat';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'كشف الحساب',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body:const UserChatBody(),
    );
  }
}

class UserChatBody extends StatelessWidget {
  const UserChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          textFromFiledItem(
            hintText: 'البحث على مستخدم',
            prefixIcon: FontAwesomeIcons.searchengin,
            pass: false,
            isSecurePassword: false,
            onChanged: (data) {},
            textType: TextInputType.name,
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, chatView.id);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .1,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kpColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Image.asset(
                    assets.klogo,
                    height: 70,
                  ),
                  Text(
                  'saleh Alkhazali',
                  style: googleFont30.copyWith(fontSize: 18),
                 ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
