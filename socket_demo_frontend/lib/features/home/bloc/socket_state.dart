import 'package:socket_demo/models/chat_model.dart';

sealed class SocketState {
  const SocketState();
}

class SocketInitial extends SocketState {}
class SocketConnected extends SocketState {}
class SocketLoading extends SocketState {}
class SocketDisconnected extends SocketState {}
class SocketReply extends SocketState {
  final String msg;
  const SocketReply(this.msg);
}
class SocketSentMessage extends SocketState {}
class SocketError extends SocketState {
  final String error;
  const SocketError(this.error);
}
class SocketChats extends SocketState {
  final List<ChatModel> chats;
  const SocketChats(this.chats);
}

class SocketNewUser extends SocketState{
  final String user;
  const SocketNewUser(this.user);
}