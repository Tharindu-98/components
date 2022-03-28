import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final int number;
  final String text;

  const Answer(this.number, this.text, {Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("($number).  "),
          Expanded(child: Text(text))
        ],
      ),
    );
  }
}
