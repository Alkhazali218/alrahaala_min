part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess({required this.message});
}
final class RegisterFailures extends RegisterState {
  final String message;

  RegisterFailures({required this.message});
}
