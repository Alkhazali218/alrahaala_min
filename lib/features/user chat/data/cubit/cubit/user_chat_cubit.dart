import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
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

        await userRef.set({
          kNumber: infoLoginModel.phone,
          kUserName: name,
          kCreatedAt: DateTime.now(),
          kFcmToken: token,
          kUserType: infoLoginModel.userType,
          kBranchID: infoLoginModel.branchID,
        });

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
      final userType =
          CacheNetWork.getCacheDaTaInfo(key: 'UserType').toString();
      final branchID =
          CacheNetWork.getCacheDaTaInfo(key: 'BranchID').toString();
      final currentUserPhone = 
          CacheNetWork.getCacheDaTaInfo(key: 'Phone').toString();

      var result = await FirebaseFirestore.instance.collection(kUsersCollections).get();

       List<UserChatModel> allUsers = result.docs
        .map((doc) => UserChatModel.fromJson(doc.data()))
        //  استثناء المستخدم الحالي من البداية
        .where((user) => user.number != currentUserPhone)
        .toList();

      if (userType == '4') {
        // Admin: يرى المستخدمين من نفس الفرع فقط، بشرط أن يكونوا ليسوا Admin
        userList = allUsers
            .where((user) => user.userType != '4' && user.branchID == branchID)
            .toList();
      } else if (userType == '3') {
        // المستخدم العادي: يرى كل الأدمن، بغض النظر عن الفرع
        userList = allUsers.where((user) => user.userType == '4').toList();
      } else {
        // أي نوع آخر: يرى الأدمن فقط من نفس الفرع
        userList = allUsers
            .where((user) => user.userType == '4' && user.branchID == branchID)
            .toList();
      }

      emit(UserChatSuccess());
    } catch (e) {
      print("حدث خطأ: $e");
      if (e is FirebaseException) {
        emit(UserChatError(message: e.toString()));
      }
    }
  }
}
