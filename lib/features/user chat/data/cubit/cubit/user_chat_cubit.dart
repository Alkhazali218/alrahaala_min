import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/login/data/models/login_model.dart';
import 'package:alrahaala/features/user%20chat/data/models/user_chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_chat_state.dart';

class UserChatCubit extends Cubit<UserChatState> {
  UserChatCubit() : super(UserChatInitial());

  CollectionReference message =
      FirebaseFirestore.instance.collection(kUsersCollections);
  List<UserChatModel> userList = [];

  Future<void> addUser({required LoginUserModel loginUserModel}) async {
    try {
      var userQuery = await message
          .where(kNumber, isEqualTo: loginUserModel.phoneNumber)
          .get();

      if (userQuery.docs.isEmpty) {
        await message.add(
          {
            kNumber: loginUserModel.phoneNumber,
            kUserName: loginUserModel.name,
            kCreatedAt: DateTime.now(),
          },
        );
      } else {
        print("المستخدم موجود بالفعل في Firebase");
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
      if (e is FirebaseException) {
        emit(UserChatError(message: e.toString()));
      }
    }
  }
}
