import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/helper/routes.dart';
import 'package:alrahaala/core/utils/helper/thems.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_for_friend_item.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/chat_buble_item.dart';
import 'package:alrahaala/features/chat/Presentation/widgets/text_filed_chat.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyCustomChat extends StatefulWidget {
  const BodyCustomChat({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BodyCustomChatState createState() => _BodyCustomChatState();
}

class _BodyCustomChatState extends State<BodyCustomChat> {
  final _controller = ScrollController();
  final _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var args = ModalRoute.of(context)!.settings.arguments as MyArguments;

    BlocProvider.of<ChatCubit>(context)
        .getMessage(idReceiver: args.receiverNumber);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as MyArguments;

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is ChatSucess) {
                var messageList =
                    BlocProvider.of<ChatCubit>(context).messageList;

                if (messageList.isEmpty) {
                  return Center(
                    child: Text(
                      "لا توجد رسائل حالياً",
                      style: googleFont30.copyWith(
                          fontSize: getRsonsiveFontSize(context, fontSize: 30)),
                    ),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    var message = messageList[index];
                    return message.idReceiver == args.receiverNumber
                        ? chatBubleItem(message: message)
                        : chatBubleForFriendItem(message: message);
                  },
                );
              } else if (state is ChatFaliures) {
                return Center(
                  child: Text(
                    state.message,
                    style: googleFont30.copyWith(
                        fontSize: getRsonsiveFontSize(context, fontSize: 30)),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(color: kpColor));
              }
            },
          ),
        ),
        TextFieldChat(
          controller: _textController,
          onTap: () => _sendMessage(
            data: _textController.text,
            context: context,
            idReceiver: args.receiverNumber,
            fcmToken: args.fcmToken,
          ),
        ),
      ],
    );
  }

  void _sendMessage({
    required String data,
    required BuildContext context,
    required String idReceiver,
    required String fcmToken,
  }) async {
    LoginUserModel? idSender = BlocProvider.of<ChatCubit>(context).numberSender;
    
      BlocProvider.of<ChatCubit>(context).sendMessage(
        data: data,
        numberSender: idSender!,
        idReceiver: idReceiver,
        fcmToken: fcmToken,
      );
    _textController.clear();
    await Future.delayed(const Duration(milliseconds: 200));

    _controller.animateTo(0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
