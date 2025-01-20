part of 'login_cubit.dart';
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
}
final class LoginFaliures extends LoginState {
  final String message;
  LoginFaliures({required this.message});
}
