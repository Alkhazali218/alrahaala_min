part of 'login_cubit.dart';

@immutable
sealed class SingInState {}

final class SingInInitial extends SingInState {}
final class SingInLoading extends SingInState {}
final class SingInSuccess extends SingInState {
  final String message;

  SingInSuccess({required this.message});
}

final class SingInFailures extends SingInState {
  final String message;

  SingInFailures({required this.message});
}