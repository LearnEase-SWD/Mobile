import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../widgets/animation/AnimatedScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Welcome to My App!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 115,
                  child: const AnimatedScreen(),
                ),
                SizedBox(
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'LearnEase is an online learning platform that uses '
                              'artificial intelligence (AI) to provide comprehensive study materials for exams like PTE, IELTS, TOEFL, and SAT.',
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 100,
                      pause: const Duration(seconds: 5),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ),
                ),
                const Text(
                  'Please sign in with your Google account to continue.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/google_logo.png', height: 24),
                      const SizedBox(width: 10),
                      const Text(
                        'Login with Google',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.info, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      'By signing in, you agree to our Terms & Privacy Policy.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                '© 2025 LearnEase. All rights reserved.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
