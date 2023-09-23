import 'package:advance_date_app/data/model/post.dart';
import 'package:advance_date_app/data/service/create_post_service.dart';
import 'package:flutter/material.dart';

import '../data/service/get_post_service.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';

  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(message, null, token).call();
    message = '';
    getPost();
  }
}
