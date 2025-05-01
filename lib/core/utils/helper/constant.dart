import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

const kprimaryColor = Colors.white;
const kcolor = Color(0xff603F26);
const kpColor = Colors.orange;
const colorStack = Color(0xffB99470);

//const models chat
const kMessagesCollections = 'messages';
const kUsersCollections = 'Users';
const kNumber = 'number';
const kUserName = 'UserName';
const kMessage = 'message';
const kCreatedAt = 'createdAt';
const kIdSender = 'idSender';
const kIdReceiver = 'idReceiver';
const kTopic = 'alrahaala';
const kFcmToken = 'fcmToken';
const kUserType = 'UserType';
const kBranchID = 'BranchID';

double getRsonsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  late String deviceId;

  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    deviceId = iosDeviceInfo.identifierForVendor!;
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId = androidDeviceInfo.id;
  } else {
    deviceId = 'null';
  }
  return deviceId;
}
