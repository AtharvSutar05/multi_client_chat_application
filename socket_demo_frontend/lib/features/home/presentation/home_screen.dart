import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_demo/features/home/bloc/socket_cubit.dart';
import 'package:socket_demo/features/home/bloc/socket_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController msgController = TextEditingController();
  final ScrollController scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    context.read<SocketCubit>().connect();
  }

  void onSend() {
    if(msgController.text.isNotEmpty) {
      context.read<SocketCubit>().sendMessage(
        msgController.text.trim(),
      );
      msgController.clear();
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocConsumer<SocketCubit, SocketState>(
                  listener: (context, state) {
                    if(state is SocketNewUser) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.user)));
                    }
                  },
                  builder: (context, state) {
                    if (state is SocketChats) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                      return Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: state.chats.length,
                          itemBuilder: (context, index) {
                            final chat = state.chats[index];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              width: double.infinity,
                              child: Align(
                                alignment: chat.sc
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                child: Row(
                                  spacing: 16,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if(!chat.sc) CircleAvatar(child: Icon(Icons.link)),
                                    Text(chat.message),
                                    if(chat.sc) CircleAvatar(child: Icon(Icons.person)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Expanded(child: Center(child: Text("Empty chat")));
                    }
                  },
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: msgController,
                            decoration: InputDecoration(hintText: "Enter message"),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "message is required";
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) => onSend(),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: onSend,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.send_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
