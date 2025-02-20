abstract class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  List<String> user;
  UserSuccess({required this.user});
}

final class UserFaliures extends UserState {
  final String message;

  UserFaliures({required this.message});
}
