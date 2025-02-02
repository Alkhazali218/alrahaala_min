import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/custom_user_item.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
 const RecentChats({super.key, required this.filteredData, required this.userList});
  final List<UserChatModel> userList;
  final List<UserChatModel> filteredData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: filteredData.isNotEmpty ? filteredData.length : userList.length,
        itemBuilder: (context, index) {
          return CustomUserItem(
            userChatModel: filteredData.isNotEmpty ? filteredData[index] : userList[index],
          );
        },
      ),
    );
  }
}


