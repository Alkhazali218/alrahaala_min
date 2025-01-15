import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

   Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess(message: 'تم انشاء حساب بنجاح'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailures( message: 'يوجد خطا في الايميل او كلمة السر'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailures( message:'الايميل مستخدم مسبقا'));
      }
    }
  }
}
