import 'package:flutter/material.dart';
import 'package:learn_ease_mobile/views/AuthScreen/LoginScreen.dart';
import 'package:learn_ease_mobile/views/SecreenController.dart';

void main() {
  runApp(const MyApp()); // Sử dụng MyApp làm widget gốc
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Sử dụng MaterialApp
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(), // Đặt ScreenController làm home
    );
  }
}


