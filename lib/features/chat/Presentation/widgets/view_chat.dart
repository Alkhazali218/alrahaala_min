import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_for_friend_item.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewChat extends StatelessWidget {
  ViewChat({super.key});
  final _controller = ScrollController();
  LoginModel? loginModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var messageList = BlocProvider.of<ChatCubit>(context).messageList;
          return ListView.builder(
            reverse: true,
            controller: _controller,
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              return messageList[index].idSender == loginModel
                  ? chatBubleItem(message: messageList[index])
                  : chatBubleForFriendItem(message: messageList[index]);
            },
          );
        },
      ),
    );
  }
}
