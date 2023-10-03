// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String greenWord;
  String blackWord;
  CustomAppBar({
    this.greenWord = '',
    this.blackWord = '',
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.greenWord,
          style: const TextStyle(
            color: Colors.green,
            fontFamily: 'Play',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          blackWord,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Play',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
