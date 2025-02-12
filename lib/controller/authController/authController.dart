import 'package:flutter/material.dart';
import '../../views/MainScreen.dart';
import '../../models/authService/authService.dart';

class AuthController {
  final AuthService authService;

  AuthController({required this.authService});

  Future<void> login(BuildContext context) async {
    final user = await authService.signInWithGoogle();
    if (user != null) {
      print('Login successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(user:user)),
      );
    } else {
      print('Login failed');
    }
  }
}
