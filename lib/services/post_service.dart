import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Uuid _uuid = Uuid();

  Future<void> createPost({
    required String uid,
    required String username,
    required String userImage,
    required String text,
    File? imageFile,
  }) async {
    try {
      String postId = _uuid.v4();
      String? imageUrl;

      if (imageFile != null) {
        Reference ref = _storage.ref().child('posts').child('$postId.jpg');
        await ref.putFile(imageFile);
        imageUrl = await ref.getDownloadURL();
      }

      await _firestore.collection('posts').doc(postId).set({
        'postId': postId,
        'uid': uid,
        'username': username,
        'userImage': userImage,
        'text': text,
        'imageUrl': imageUrl ?? '',
        'timestamp': FieldValue.serverTimestamp(),
        'likes': [],
        'commentsCount': 0,
      });
    } catch (e) {
      throw Exception('فشل رفع المنشور: $e');
    }
  }
}
