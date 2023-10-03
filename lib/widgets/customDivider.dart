import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      height: 10,
      thickness: 1.5,
      endIndent: 20,
    );
  }
}
