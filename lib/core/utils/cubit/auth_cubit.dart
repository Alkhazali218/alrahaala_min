import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

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
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthError('يوجد خطا في الايميل او كلمة السر'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthError('الايميل مستخدم مسبقا'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  Future<void> loginUser({required String email,required String password}) async {
    try {
      emit(AuthLoading());
   await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  emit(AuthSuccess());
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  emit(AuthError('لم يتم عثور على حساب, رجاءا قم بانشاء حساب '));
  } else if (e.code == 'wrong-password') {
  emit(AuthError('لقد قمت بادخال بريد او كلمة سر خطا'));
  } 
} catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
