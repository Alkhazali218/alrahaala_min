import 'package:alrahaala/features/chat/data/models/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSucess extends ChatState {
  List<ChatMessageModel> messages = [];
  ChatSucess({required this.messages});
}
