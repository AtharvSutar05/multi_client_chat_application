import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_demo/core/constants/app_constants.dart';
import 'package:socket_demo/features/home/bloc/socket_cubit.dart';
import 'package:socket_demo/features/home/presentation/home_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SocketCubit())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppConstants.themeData,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
