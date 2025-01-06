import 'package:alrahaala/cubit/Auth%20cubit/Auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> register(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError(message: 'يوجد خطا في الايميل او كلمة السر'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError(message: 'الايميل مستخدم مسبقا'));
      }
    } catch (e) {
      emit(AuthError(message: '{$e}'));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSucess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthError(message: 'لم يتم عثور على حساب, رجاءا قم بانشاء حساب '));
      } else if (e.code == 'wrong-password') {
        emit(AuthError(message: 'لقد قمت بادخال بريد او كلمة سر خطا'));
      } else {
        emit(AuthError(message: 'لقد قمت بادخال بريد او كلمة سر خطا'));
      }
    }
  }
}
