import 'package:flutter/material.dart';

class CustomBodyText extends StatelessWidget {
  CustomBodyText({
    super.key,
    required this.bodyText,
    this.textSize = 18,
    this.textColor = Colors.black,
    this.textWeight = FontWeight.normal,
    this.maxLine,
  });
  String bodyText;
  double textSize;
  Color textColor;
  int? maxLine;
  FontWeight textWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        bodyText,
        style: TextStyle(
          color: textColor,
          fontWeight: textWeight,
          fontSize: this.textSize,
          fontFamily: 'Play',
        ),
        maxLines: maxLine,
        textAlign: TextAlign.start,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
