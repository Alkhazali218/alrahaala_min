import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess('تم انشاء حساب بنجاح'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError( 'يوجد خطا في الايميل او كلمة السر'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError( 'الايميل مستخدم مسبقا'));
      }
    }
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      emit(AuthLoading());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess('تم تسجيل الدخول بنجاح'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthError( 'لم يتم عثور على حساب, رجاءا قم بانشاء حساب '));
      } else if (e.code == 'wrong-password') {
        emit(AuthError( 'لقد قمت بادخال بريد او كلمة سر خطا'));
      } 
    }
  }
}
