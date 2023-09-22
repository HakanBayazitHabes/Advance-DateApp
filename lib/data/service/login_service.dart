import 'dart:convert';

import 'package:advance_date_app/data/response/login_response.dart';
import 'package:advance_date_app/data/service/base_service.dart';
import 'package:http/http.dart' as http;

import '../../config/app_config.dart';

class LoginService extends ServiceBase<LoginResponse> {
  final String username;
  final String password;

  LoginService(this.username, this.password);

  Future<LoginResponse> call() async {
    final result = await http.post(
      Uri.parse('${AppConfig.baseUrl}/login'),
      body: jsonEncode({'username': username, 'password': password}),
    );
    return LoginResponse.fromJson(jsonDecode(result.body)['data']);
  }
}
