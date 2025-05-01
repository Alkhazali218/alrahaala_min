import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatModel {
  final String number;
  final String userName;
  final DateTime createdAt;
  final String fcmToken;
  final String userType;
  final String branchID;

  UserChatModel({
    required this.number,
    required this.userName,
    required this.createdAt,
    required this.fcmToken,
    required this.userType,
    required this.branchID,
  });

  factory UserChatModel.fromJson(dataJson) {
    return UserChatModel(
      number: dataJson[kNumber] ?? '',
      userName: dataJson[kUserName] ?? '',
      createdAt: (dataJson[kCreatedAt] as Timestamp).toDate(),
      fcmToken: dataJson[kFcmToken] ?? '',
      userType: dataJson[kUserType]?.toString() ?? '',
      branchID: dataJson[kBranchID]?.toString() ?? '',
    );
  }
}
