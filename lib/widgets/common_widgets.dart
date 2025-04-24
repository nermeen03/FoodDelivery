import 'package:flutter/material.dart';

class ExpandSingleText extends StatelessWidget {
  const ExpandSingleText({
    super.key,
    required this.text,
    required this.size
  });

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
          softWrap: false,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}