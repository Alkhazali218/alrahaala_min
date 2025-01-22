import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/text_filed_chat.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyCustomChat extends StatelessWidget {
  BodyCustomChat({super.key});
  final _controller = ScrollController();
  final _textController = TextEditingController();
  LoginModel? numberSender;
  UserChatModel? numberReceiver;

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
        TextFieldChat(
          controller: _textController,
          onTap: () =>
              _sendMessage(data: _textController.text, context: context),
        ),
      ],
    );
  }

  void _sendMessage(
      {required String data, required BuildContext context}) async {
    BlocProvider.of<ChatCubit>(context).sendMessage(
      data: data,
      loginUserModel: numberSender!,
      userChatModel: numberReceiver!,
    );
    _textController.clear();

    _controller.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
