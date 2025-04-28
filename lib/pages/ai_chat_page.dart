import 'package:flutter/material.dart';
import 'package:social_dz/components/mytext.dart';

class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      body: Center(
        child: Mytext(
          text: "This is the Ai chat page",
          color: colors.onSurface,
          size: 30,
          isFight: false,
        ),
      ),
    );
  }
}
