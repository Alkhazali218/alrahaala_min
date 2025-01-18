import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sing_in_state.dart';

class SingInCubit extends Cubit<SingInState> {
  SingInCubit() : super(SingInInitial());

    Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      emit(SingInLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SingInSuccess(message: 'تم تسجيل الدخول بنجاح'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SingInFailures(message: "لم يتم العثور على حساب، رجاءً قم بإنشاء حساب"));
      } else if (e.code == 'wrong-password') {
        emit(SingInFailures(message:'لقد قمت بإدخال بريد إلكتروني أو كلمة سر خاطئة'));
      } else {
        emit(SingInFailures(message:'لقد قمت بإدخال بريد إلكتروني أو كلمة سر خاطئة'));
      }
    }
  }
}
