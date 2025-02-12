import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_chat_state.dart';

class UserChatCubit extends Cubit<UserChatState> {
  UserChatCubit() : super(UserChatInitial());

  CollectionReference message =
      FirebaseFirestore.instance.collection(kUsersCollections);
  List<UserChatModel> userList = [];

  Future<void> addUser({required InfoModel infoLoginModel}) async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      // استخدام رقم الهاتف كمفتاح للمستند
      DocumentReference userRef = message.doc(infoLoginModel.phone);

      var userDoc = await userRef.get();

      if (!userDoc.exists) {
        // إذا كان المستند غير موجود، نقوم بإنشائه
        await userRef.set(
          {
            kNumber: infoLoginModel.phone,
            kUserName: infoLoginModel.accName,
            kCreatedAt: DateTime.now(),
            kFcmToken: token,
          },
        );
        print("تم إضافة المستخدم بنجاح.");
      } else {
        print("تم العثور على المستخدم في Firebase.");
      }
    } on Exception catch (e) {
      if (e is FirebaseException) {
        print('FirebaseException is : $e');
      }
    }
  }

  Future<void> fetchUsers() async {
    try {
      var result =
          await FirebaseFirestore.instance.collection(kUsersCollections).get();

      userList =
          result.docs.map((doc) => UserChatModel.fromJson(doc.data())).toList();

      emit(UserChatSuccess());
    } catch (e) {
      print("حدث خطأ: $e");
      if (e is FirebaseException) {
        emit(UserChatError(message: e.toString()));
      }
    }
  }
}
