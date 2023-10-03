import 'package:flutter/material.dart';

class CustomHeadText extends StatelessWidget {
  CustomHeadText({
    super.key,
    required this.title,
    this.textColor = Colors.black,
  });
  String title;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        this.title,
        style: TextStyle(
          color: textColor,
          fontFamily: 'Play',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
