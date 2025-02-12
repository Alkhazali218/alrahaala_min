import 'package:alrahaala/core/Notification/send%20fcm/send_fcm.dart';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_state.dart';
import 'package:alrahaala/features/chat/data/models/message_model.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<ChatMessageModel> messageList = [];

  InfoModel? numberSender;

  String? getNumberSender() {
    return numberSender?.phone;
  }

  void setUser(InfoModel user) {
    numberSender = user;
  }

  void sendMessage({
    required String data,
    required InfoModel numberSender,
    required String idReceiver,
    required String fcmToken,
  }) {
    String chatId = _getChatId(numberSender.phone, idReceiver);

    try {
      message.doc(chatId).collection(kMessagesCollections).add({
        kIdSender: numberSender.phone,
        kIdReceiver: idReceiver,
        kMessage: data,
        kCreatedAt: DateTime.now(),
        kFcmToken: fcmToken,
      }).then((_) async {
        // إرسال إشعار FCM إلى جهاز المستقبل
        await SendFcm.apiFcm(body: data, title: 'رسالة جديدة', token: fcmToken);
      });
    } on Exception catch (e) {
      emit(ChatFaliures(message: e.toString()));
    }
  }

  void getMessage({required String idReceiver}) {
    String? idSender = numberSender?.phone;

    String chatId = _getChatId(idSender!, idReceiver);

    message
        .doc(chatId)
        .collection(kMessagesCollections)
        .orderBy(kCreatedAt, descending: true)
        .snapshots()
        .listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(ChatMessageModel.fromJson(doc));
      }
      emit(ChatSucess(messages: List.from(messageList)));
    });
  }

  String _getChatId(String idSender, String idReceiver) {
    if (idSender.compareTo(idReceiver) > 0) {
      return '$idReceiver-$idSender';
    } else {
      return '$idSender-$idReceiver';
    }
  }
}
