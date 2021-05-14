import 'dart:async';

import 'package:basic_login_page/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostsRepository {
  final postsCollection = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addNewPost(Post post) {}

  @override
  Future<void> deletePost(Post post) async {}

  @override
  Stream<List> posts() {
    return postsCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc).toList());
  }

  @override
  Future<void> updatePost(Post update) {}
}
