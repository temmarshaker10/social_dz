import 'package:flutter/material.dart';

import 'mytext.dart' show Mytext;

class Google extends StatelessWidget {
  final VoidCallback onTap;
  final String imagepath;
  final String text;
  final Color color;
  const Google({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colors.shadow,
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          color: colors.onSecondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Mytext(text: text, color: color, size: 23, isFight: true),
              Image.asset(imagepath, height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
