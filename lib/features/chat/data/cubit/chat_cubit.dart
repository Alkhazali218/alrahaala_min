import 'package:alrahaala/core/Notification/models/repo/notification_repo.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.notificationRepo) : super(ChatInitial());
  final NotificationRepo notificationRepo;

  CollectionReference message = FirebaseFirestore.instance.collection(kMessagesCollections);

  List<ChatMessageModel> messageList = [];

  String? currentUserPhoneNumber;

  void sendMessage({
    required String data,
  }) {
    if (currentUserPhoneNumber == null) {
      // ignore: avoid_print
      print("User is not logged in");
      return;
    }
    try {
      message.add({
        kMessage: data,
        kCreatedAt: DateTime.now(),
        KUserId: currentUserPhoneNumber,
      }).then(
        (_) async {
          notificationRepo.fetchNotificationMessage(
            body: data,
            title: 'دردشة المستخدمين',
            topic: kTopic,
          );
        },
      );
    } on Exception catch (e) {
      print("Error sending message: $e");
    }
  }

  // جلب الرسائل من Firebase
  void getMessage() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(ChatMessageModel.fromJson(doc));
      }
      emit(ChatSucess(messages: List.from(messageList)));
    });
  }

  // تعيين رقم الهاتف بعد تسجيل الدخول
  void setCurrentUser(String phoneNumber) {
    currentUserPhoneNumber = phoneNumber;
  }
}
