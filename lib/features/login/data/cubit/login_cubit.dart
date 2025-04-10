import 'package:alrahaala/core/utils/local%20NetWork/local_netWork.dart';
import 'package:alrahaala/features/chat/data/cubit/chat_cubit.dart';
import 'package:alrahaala/features/login/data/models/repo/login_repo.dart';
import 'package:alrahaala/features/user%20chat/data/cubit/cubit/user_chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> loginUser({
    required String number,
    required String password,
    required String deviceId,
    required BuildContext context,
  }) async {
    emit(LoginLoading());

    var result = await loginRepo.featchLogin(
        phone: number, password: password, deviceId: deviceId);

    result.fold(
      (failures) {
        emit(LoginFaliures(message: failures.errorMessage));
      },
      (loginSuccessData) {
        var info = loginSuccessData.info;

        BlocProvider.of<ChatCubit>(context).setUser(info);

        // إضافة المستخدم إلى `UserChatCubit`
        BlocProvider.of<UserChatCubit>(context).addUser(infoLoginModel: info);

        CacheNetWork.insterToInfo(key: 'AccName', value: info.accName);
        CacheNetWork.insterToInfo(key: 'BName', value: info.bName);
        CacheNetWork.insterToInfo(key: 'branchID', value: info.branchID);
        CacheNetWork.insterToInfo(key: 'cName', value: info.cName);
        CacheNetWork.insterToInfo(key: 'phone', value: info.phone);
        CacheNetWork.insterToInfo(key: 'AccCode', value: info.accCode);
        CacheNetWork.insterToInfo(key: 'Countires_ID', value: info.countiresId);
        CacheNetWork.insterToInfo(key: 'defualtCurrency', value: info.defualtCurrency);
        CacheNetWork.insterToInfo(key: 'curCode', value: info.curCode);
        CacheNetWork.insterToInfo(key: 'AccID', value: info.accID);
        CacheNetWork.insterToInfo(key: 'Countries', value: info.countries);
        CacheNetWork.insterToInfo(key: 'phone', value: info.phone);

        ///token
        CacheNetWork.insterToInfo(key: 'token', value: loginSuccessData.data.token);

        emit(LoginSuccess());
      },
    );
  }
}

//   var user = loginSuccessData.user;

//   // تعيين `numberSender` في `ChatCubit` بعد نجاح تسجيل الدخول
//     BlocProvider.of<ChatCubit>(context).setUser(user);

//   // يمكنك أيضا تمرير المستخدم إلى `UserChatCubit` إذا لزم الأمر
//   BlocProvider.of<UserChatCubit>(context).addUser(loginUserModel: user);

//   emit(LoginSuccess());
// },
