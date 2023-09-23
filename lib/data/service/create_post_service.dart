import 'package:advance_date_app/data/model/post.dart';

import 'base_service.dart';

class CreatePostService extends ServiceBase<void> {
  final String message;
  final String? image;
  final String token;

  CreatePostService(this.message, this.image, this.token);

  @override
  Future<void> call() async {
    final body = {
      'message': message,
    };
    if (image != null) {
      body['image'] = image!;
    }

    final result = await post('post', body: body, token: token);
  }
}
