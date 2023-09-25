import 'package:advance_date_app/data/model/user.dart';
import 'package:advance_date_app/data/service/get_all_user_service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>> getAllUser() async {
    return await GetAllUserService().call();
  }
}
