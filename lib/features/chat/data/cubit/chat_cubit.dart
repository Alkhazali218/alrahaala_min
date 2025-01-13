import 'package:alrahaala/core/Notification/models/repo/notification_repo.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.notificationRepo) : super(chatInitial());
  final NotificationRepo notificationRepo;
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
      }).then((_) async {
        notificationRepo.fetchNotificationMessage(
            body: data, title: 'دردشة المستخدمين', topic: kTopic);
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
