import 'package:alrahaala/core/utils/helper/routes.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/Presentation/chat_view.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/custom_bade_item.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/custom_user_name_item.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomUserItem extends StatelessWidget {
  const CustomUserItem({super.key, required this.userChatModel});
  final UserChatModel userChatModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, chatView.id, arguments: MyArguments(receiverNumber: userChatModel.number, fcmToken: userChatModel.fcmToken));
        },
        child: SizedBox(
          height: height * 0.09,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: SvgPicture.asset(
                  assets.kLogoUserChat,
                ),
              ),
              CustomUserNameItem(userChatModel: userChatModel),
              const Spacer(),
              CustomBadgeItem(userChatModel: userChatModel),
            ],
          ),
        ),
      ),
    );
  }
}
