import 'package:flutter/material.dart';
import 'package:social_dz/components/mytext.dart';

class Mybutton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const Mybutton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
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
          color: Color(0xFF007AFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Mytext(
            text: text,
            color: colors.onPrimary,
            size: 25,
            isFight: true,
          ),
        ),
      ),
    );
  }
}
