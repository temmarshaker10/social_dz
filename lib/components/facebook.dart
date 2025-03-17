import 'package:flutter/material.dart';

import 'mytext.dart' show Mytext;

class Facebook extends StatelessWidget {
  final VoidCallback onTap;
  final String imagepath;
  final String text;
  const Facebook({
    super.key,
    required this.onTap,
    required this.text,
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
          color: colors.secondaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Mytext(text: text, color: Colors.white, size: 23, isFight: true),
              Image.asset(imagepath, height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
