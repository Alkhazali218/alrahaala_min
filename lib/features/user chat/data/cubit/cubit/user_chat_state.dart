part of 'user_chat_cubit.dart';


sealed class UserChatState {}

final class UserChatInitial extends UserChatState {}

final class UserChatLoading extends UserChatState {}
final class UserChatSuccess extends UserChatState {}

final class UserChatError extends UserChatState {
  final String message;

  UserChatError({required this.message});
}