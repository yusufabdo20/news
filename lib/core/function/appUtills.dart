import 'package:flutter/material.dart';

class AppUtills {
  static void navigateTo(context, widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static const String apiKey = 'd77993ed225b47b88e846f179bf8b995';
  static const String baseUrl = 'https://newsapi.org';
}
