part of 'login_cubit.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFaliures extends LoginState {
  final String message;
  LoginFaliures({required this.message});
}
