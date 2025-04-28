import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/post_model.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // إضافة منشور جديد
  Future<void> createPost(PostModel post) async {
    try {
      await _firestore.collection('posts').doc(post.postId).set(post.toMap());
    } catch (e) {
      throw Exception('خطأ أثناء إنشاء المنشور: $e');
    }
  }
}
