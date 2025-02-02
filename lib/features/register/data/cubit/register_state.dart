part of 'register_cubit.dart';

 class RegisterState {}

 class RegisterInitial extends RegisterState {}
 class RegisterLoading extends RegisterState {}

 class RegisterSuccess extends RegisterState {}

 class RegisterFaliures extends RegisterState {
  final String message;

  RegisterFaliures({required this.message});
}
