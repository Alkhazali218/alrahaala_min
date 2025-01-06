import 'package:alrahaala/core/Notification/notification_messages.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/model/messages/message_model.dart';
import 'package:alrahaala/cubit/chat%20cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(chatInitial());

  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<MessageModel> messageList = [];

  void sendMessage({
    required String data,
    required String email,
    required String token,
  }) {
    try {
      message.add({
        kMessage: data,
        kCreatedAt: DateTime.now(),
        KUserId: email,
      }).then((_) {
        // إرسال إشعار عند إضافة رسالة جديدة
        NotificationMessages().sendNotification(
          bodyNotifiacation: data,
          title: 'دردشة جماعية',
        );
      });
    } on Exception catch (e) {
      print("Error sending message: $e");
    }
  }

  void getMessage() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }
      emit(chatSucess(messages: List.from(messageList)));
    });
  }
}
