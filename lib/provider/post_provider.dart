import 'package:advance_date_app/data/model/post.dart';
import 'package:flutter/material.dart';

import '../data/service/get_post_service.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];

  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }
}
