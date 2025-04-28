import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // رفع الصورة إلى Storage و إرجاع رابطها
  Future<String> uploadPostImage(File imageFile) async {
    try {
      String fileName =
          DateTime.now().millisecondsSinceEpoch.toString(); // اسم فريد للصورة
      Reference ref = _storage.ref().child('post_images').child(fileName);

      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // الحصول على الرابط المباشر للصورة
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('خطأ أثناء رفع الصورة: $e');
    }
  }
}
