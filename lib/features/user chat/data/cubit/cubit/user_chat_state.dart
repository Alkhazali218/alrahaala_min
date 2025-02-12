part of 'user_chat_cubit.dart';

class UserChatState {}

class UserChatInitial extends UserChatState {}

class UserChatLoading extends UserChatState {}

class UserChatSuccess extends UserChatState {}

class UserChatError extends UserChatState {
  final String message;

  UserChatError({required this.message});
}
