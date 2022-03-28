import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final List<Widget> children;

  const Question({required this.children, Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: children
        ),
      );
  }
}