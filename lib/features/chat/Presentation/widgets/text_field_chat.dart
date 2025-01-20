import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, camel_case_types
class bodyCustomChat extends StatelessWidget {
  bodyCustomChat({super.key});

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: kpColor));
            }
            if (state is ChatSucess) {
              var messageList = BlocProvider.of<ChatCubit>(context).messageList;
              return ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return chatBubleItem(message: messageList[index]);
                },
              );
            } else {
              return Text(
                'حدث خطا في جلب البيانات رجاؤا اعادة المحاولة لاحقا',
                style: googleFont30,
              );
            }
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Send Message',
              suffixIcon: GestureDetector(
                onTap: () => _sendMessage(
                    context: context, data: controller.text),
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
      required BuildContext context}) async {
    BlocProvider.of<ChatCubit>(context)
        .sendMessage(data: controller.text);
    controller.clear();

    _controller.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
