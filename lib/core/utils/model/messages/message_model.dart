import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String message;
  final DateTime createdAt;

  MessageModel({required this.id, required this.message, required this.createdAt});

  // تحويل البيانات من JSON إلى MessageModel
  factory MessageModel.fromJson(dataJson) {
    return MessageModel(
      id: dataJson[KUserId],
      message: dataJson[kMessage],
      createdAt: (dataJson[kCreatedAt] as Timestamp).toDate(),
    );
  }
}