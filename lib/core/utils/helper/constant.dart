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



  double getRsonsiveFontSize(BuildContext context,{required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if(width < 600) {
    return width / 400;
  } else if(width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

