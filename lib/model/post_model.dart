import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postId;
  final String userId;
  final String userName;
  final String userImage;
  final String text;
  final String imageUrl;
  final Timestamp timestamp;
  final int likes;
  final int commentsCount;

  PostModel({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.text,
    required this.imageUrl,
    required this.timestamp,
    required this.likes,
    required this.commentsCount,
  });

  // تحويل من Map إلى كائن PostModel
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map['postId'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userImage: map['userImage'] ?? '',
      text: map['text'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      likes: map['likes'] ?? 0,
      commentsCount: map['commentsCount'] ?? 0,
    );
  }

  // تحويل من PostModel إلى Map (للتخزين في Firestore)
  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'text': text,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
      'likes': likes,
      'commentsCount': commentsCount,
    };
  }
}
