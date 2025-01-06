import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/cubit/chat%20cubit/chat_cubit.dart';
import 'package:alrahaala/cubit/chat%20cubit/chat_state.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_for_friend_item.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, camel_case_types
class bodyCustomChat extends StatelessWidget {
  bodyCustomChat({super.key,required this.email});

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  FirebaseMessaging _FirebaseMessaging = FirebaseMessaging.instance;
  String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var messageList = BlocProvider.of<ChatCubit>(context).messageList;
              return ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return messageList[index].id == email
                      ? chatBubleItem(message: messageList[index])
                      : chatBubleForFriendItem(message: messageList[index]);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Send Message',
              suffixIcon: GestureDetector(
                onTap: () => _sendMessage(context: context,data: controller.text,email: email),
                child: const Icon(
                  Icons.send,
                  color: kcolor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: kcolor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ignore: unused_element
  void _sendMessage(
      {required String data,
      required String email,
      required BuildContext context}) async {
        String? token = await _FirebaseMessaging.getToken();
    BlocProvider.of<ChatCubit>(context)
        .sendMessage(data: controller.text, email: email,token: token!);
    controller.clear();

    _controller.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
