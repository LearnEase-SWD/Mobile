import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenController extends StatelessWidget{
  const ScreenController({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Ease'),
      ),
      body: const Center(
        child: Text("this is screen controller"),
      ),
    );
  }
}