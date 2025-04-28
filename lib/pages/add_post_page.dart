import 'package:flutter/material.dart';
import 'package:social_dz/components/mytext.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Mytext(
          text: "Add Post",
          color: colors.onSurface,
          size: 20,
          isFight: true,
        ),
      ),
    );
  }
}
