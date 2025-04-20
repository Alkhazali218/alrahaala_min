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
    // الحصول على token من FCM
    String? token = await FirebaseMessaging.instance.getToken();

    // استخدام رقم الهاتف كمفتاح للمستند
    DocumentReference userRef = message.doc(infoLoginModel.phone);

    var userDoc = await userRef.get();

    // إذا لم يكن المستخدم موجودًا، نقوم بإضافته
    if (!userDoc.exists) {
      String name = infoLoginModel.accName;

      // إزالة "حساب " إذا كانت الكلمة موجودة في الاسم
      if (name.startsWith("حساب ")) {
        name = name.substring(5);
      }

      // إضافة المستخدم إلى Firebase
      await userRef.set(
        {
          kNumber: infoLoginModel.phone,
          kUserName: name,
          kCreatedAt: DateTime.now(),
          kFcmToken: token,
        },
      );
      print("تم إضافة المستخدم بنجاح.");
    } else {
      // إذا كان المستخدم موجودًا بالفعل، نقوم بتحديث الـ FCM token
      await userRef.update({
        kFcmToken: token,
      });
      print("تم تحديث الـ FCM token للمستخدم بنجاح.");
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
