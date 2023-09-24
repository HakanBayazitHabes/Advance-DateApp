import 'package:advance_date_app/data/model/post.dart';
import 'package:advance_date_app/data/service/create_post_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/service/get_post_service.dart';
import '../utils/utils.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';
  String? imagePath;

  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    await CreatePostService(message, null, token).call();
    message = '';
    imagePath = null;
    getPost();
  }

  pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      final croppedImage = await Utils.cropImage(path);
      imagePath = croppedImage?.path ?? '';
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  deleteImage() {
    imagePath = null;
    notifyListeners();
  }
}
