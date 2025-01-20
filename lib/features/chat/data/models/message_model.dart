import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  final String id;
  final String message;
  final DateTime createdAt;

  ChatMessageModel({required this.id, required this.message, required this.createdAt});

  // تحويل البيانات من JSON إلى MessageModel
  factory ChatMessageModel.fromJson(dataJson) {
    return ChatMessageModel(
      id: dataJson[KUserId],
      message: dataJson[kMessage],
      createdAt: (dataJson[kCreatedAt] as Timestamp).toDate(),
    );
  }
}