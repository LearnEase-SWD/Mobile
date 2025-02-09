import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math' as math; // Import thư viện math

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000), // Thời gian cho một chu kỳ
      vsync: this,
    )..repeat(reverse: true); // Lặp lại và đảo ngược

    _rotateAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); // Hiệu ứng xoay

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); // Hiệu ứng phóng to/thu nhỏ
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: _controller, // Sử dụng _controller cho cả hai hiệu ứng
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: Image.asset('assets/book_logo.png', height: 60),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Learn Ease',
              textStyle: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold),
              speed: const Duration(milliseconds: 150),
            ),
          ],
          totalRepeatCount: 100,
          onFinished: () {
            print("Animation Finished");
          },
        ),
      ],
    );
  }
}