import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/recent_chats.dart';
import 'package:alrahaala/features/user%20chat/Presentation/widgets/search_text_filed.dart';
import 'package:alrahaala/features/user%20chat/data/cubit/cubit/user_chat_cubit.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserChatBody extends StatefulWidget {
  const UserChatBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserChatBodyState createState() => _UserChatBodyState();
}

class _UserChatBodyState extends State<UserChatBody> {
  List<UserChatModel> userList = [];
  List<UserChatModel> filteredData = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<UserChatCubit>(context).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
            child: SearchTextFiled(
              onChanged: (data) {
                setState(() {
                  addDataFilteredData(input: data);
                });
              },
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
                        fontSize: getRsonsiveFontSize(context, fontSize: 20)),
                  ),
                );
              } else if (state is UserChatSuccess) {
                userList = BlocProvider.of<UserChatCubit>(context).userList;
                return RecentChats(
                  filteredData: filteredData.isEmpty ? userList : filteredData,
                  userList: userList,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kpColor,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void addDataFilteredData({required String input}) {
    setState(() {
      filteredData = userList
          .where((element) =>
              element.userName.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
    });
  }
}
