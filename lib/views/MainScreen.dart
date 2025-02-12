import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final User user;

  MainScreen({required this.user});
  @override
  Widget build(BuildContext context) {
    String? name = user.displayName;
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),
      body: Center(
        child: Text(name!),  // Hiển thị token hoặc sử dụng trong ứng dụng
      ),
    );
  }
}
