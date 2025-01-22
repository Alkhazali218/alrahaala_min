import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  final String idSender;
  final String idReceiver;
  final String message;
  final DateTime createdAt;

  ChatMessageModel({required this.idSender, required this.message, required this.createdAt,required this.idReceiver});

  factory ChatMessageModel.fromJson(dataJson) {
    return ChatMessageModel(
      idSender: dataJson[kIdSender],
      idReceiver: dataJson[kIdReceiver],
      message: dataJson[kMessage],
      createdAt: (dataJson[kCreatedAt] as Timestamp).toDate(),
    );
  }
}