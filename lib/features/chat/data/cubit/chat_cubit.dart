import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference message = FirebaseFirestore.instance.collection(kMessagesCollections);

  List<ChatMessageModel> messageList = [];

  void sendMessage({
    required String data,
    required LoginModel loginUserModel,
    required UserChatModel userChatModel,
  }) {
    try {
      message.add({
        kIdSender: loginUserModel.number,
        kIdReceiver: userChatModel.number,
        kMessage: data,
        kCreatedAt: DateTime.now(),
      });
    } on Exception catch (e) {
      print("Error sending message: $e");
    }
  }


  void getMessage() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(ChatMessageModel.fromJson(doc));
      }
      emit(ChatSucess(messages: List.from(messageList)));
    });
  }
}
