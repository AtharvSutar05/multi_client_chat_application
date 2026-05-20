import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_demo/features/home/bloc/socket_state.dart';
import 'package:socket_demo/features/home/services/socket_service.dart';
import 'package:socket_demo/models/chat_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketCubit extends Cubit<SocketState>{
  SocketCubit() : super (SocketInitial());

  final socket = SocketService().connect();
  List<ChatModel> chats = [];

  void connect() {
    emit(SocketInitial());
    socket.onConnect((_) {
      emit(SocketConnected());
    });
    socket.onConnectError((error) {
      emit(SocketError(error.toString()));
    });
    socket.onDisconnect((_) {
      chats.clear();
      emit(SocketDisconnected());
    });
    socket.on('newuser', (data) {
      emit(SocketNewUser(data));
    });
    socket.on('message', (data) {
      chats.add(ChatModel(message: data.toString(), sc: false));
      emit(SocketChats(chats));
    });
    socket.on('welcome', (data) {
      chats.add(ChatModel(message: data.toString(), sc: false));
      emit(SocketChats(chats));
    });

    socket.on("myid", (data) {
      chats.add(ChatModel(message: "Your Id: ${data.toString()}", sc: false));
      emit(SocketChats(chats));
    });
  }

  void sendMessage(String msg) {
    emit(SocketInitial());
    socket.emit('message', msg);
    chats.add(ChatModel(message: msg, sc: true));
    emit(SocketChats(chats));
  }

  void disconnect() {
    socket.disconnect();
    emit(SocketDisconnected());
  }
}