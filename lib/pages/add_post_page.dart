import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/post_service.dart';

class AddPostPage extends StatefulWidget {
  final String uid;
  final String username;
  final String userImage;

  const AddPostPage({
    super.key,
    required this.uid,
    required this.username,
    required this.userImage,
  });

  @override
  State<AddPostPage> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostPage> {
  final TextEditingController _textController = TextEditingController();
  File? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  Future<void> _publishPost() async {
    if (_textController.text.trim().isEmpty && _selectedImage == null) return;

    setState(() {
      _isLoading = true;
    });

    await PostService().createPost(
      uid: widget.uid,
      username: widget.username,
      userImage: widget.userImage,
      text: _textController.text.trim(),
      imageFile: _selectedImage,
    );

    setState(() {
      _isLoading = false;
      _selectedImage = null;
      _textController.clear();
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نشر منشور جديد'),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _publishPost,
            child:
                _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('نشر', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.userImage)),
                const SizedBox(width: 8),
                Text(widget.username),
              ],
            ),
            TextField(
              controller: _textController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'ماذا تريد أن تنشر؟',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 10),
            _selectedImage != null
                ? Stack(
                  children: [
                    Image.file(_selectedImage!, height: 200),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() => _selectedImage = null);
                        },
                      ),
                    ),
                  ],
                )
                : TextButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.photo),
                  label: const Text('إضافة صورة'),
                ),
          ],
        ),
      ),
    );
  }
}
