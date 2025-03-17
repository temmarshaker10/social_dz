import 'package:flutter/material.dart';

class Mytext extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  bool isFight;
  Mytext({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    required this.isFight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isFight ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
