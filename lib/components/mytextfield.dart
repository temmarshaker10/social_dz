import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final String hinttext;
  final Color color;
  final Icon suffixicon;
  bool obsecurtext;
  final TextEditingController controller;

  Mytextfield({
    super.key,
    required this.hinttext,
    required this.color,
    required this.suffixicon,
    required this.obsecurtext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return TextField(
      obscureText: obsecurtext,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        fillColor: theme.inputDecorationTheme.fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF333333)),
        ),
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 15, color: theme.hintColor),
      ),
    );
  }
}
