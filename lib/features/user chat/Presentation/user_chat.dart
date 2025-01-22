import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/Presentation/chat_view.dart';
import 'package:alrahaala/features/login/Presentation/widgets/text_from_filed_item.dart';
import 'package:alrahaala/features/user%20chat/data/cubit/cubit/user_chat_cubit.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserChat extends StatelessWidget {
  const UserChat({super.key});

  static String id = 'UserChat';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserChatCubit>(context).fetchUsers();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'دردشة المستخدمين',
          style: googleFont30.copyWith(
            color: kprimaryColor,
            fontSize: getRsonsiveFontSize(context, fontSize: 20),
          ),
        ),
        backgroundColor: kcolor,
        foregroundColor: kprimaryColor,
      ),
      body: const UserChatBody(),
    );
  }
}

class UserChatBody extends StatelessWidget {
  const UserChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: textFromFiledItem(
              onChanged: (p0) {},
              hintText: 'Search',
              prefixIcon: Icons.search,
              pass: false,
              isSecurePassword: false,
              textType: TextInputType.name,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<UserChatCubit, UserChatState>(
            builder: (context, state) {
              if (state is UserChatError) {
                return Center(
                  child: Text(
                    state.message,
                    style: googleFont30.copyWith(
                      fontSize: getRsonsiveFontSize(context, fontSize: 20),
                    ),
                  ),
                );
              }
              if (state is UserChatSuccess) {
                var userList = BlocProvider.of<UserChatCubit>(context).userList;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return CustomUserChatItem(userChatModel: userList[index]);
                  },
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(color: kpColor));
              }
            },
          ),
        ),
      ],
    );
  }
}

class CustomUserChatItem extends StatelessWidget {
  const CustomUserChatItem({super.key, required this.userChatModel});
  final UserChatModel userChatModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, chatView.id);
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .1,
        decoration: BoxDecoration(
          color: kprimaryColor,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                assets.kLogoUserChat,
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * .030),
              Text(
                userChatModel.userName,
                style: googleFont30.copyWith(
                    fontSize: getRsonsiveFontSize(fontSize: 18, context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
