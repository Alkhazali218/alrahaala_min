import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatModel {
  final String number;
  final String userName;
  final DateTime createdAt;

  UserChatModel(
      {required this.number, required this.userName, required this.createdAt});

  factory UserChatModel.fromJson(dataJson) {
    return UserChatModel(
      number: dataJson[kNumber],
      userName: dataJson[kUserName],
      createdAt: (dataJson[kCreatedAt] as Timestamp).toDate(),
    );
  }
}
