import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease_mobile/api/firebase_api.dart';
import 'package:learn_ease_mobile/views/AuthScreen/LoginScreen.dart';
import 'package:learn_ease_mobile/views/SecreenController.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
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


