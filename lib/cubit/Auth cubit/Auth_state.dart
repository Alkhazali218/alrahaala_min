// ignore: file_names
abstract class AuthState {}

// ignore: camel_case_types
class AuthInitial extends AuthState {}

// ignore: camel_case_types
class AuthLoading extends AuthState {}

// ignore: camel_case_types
class AuthSucess extends AuthState {}

// ignore: camel_case_types
class AuthError extends AuthState {
  String message;

  AuthError({required this.message});
}
