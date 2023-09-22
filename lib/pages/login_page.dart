import 'dart:convert';

import 'package:advance_date_app/config/app_icons.dart';
import 'package:advance_date_app/config/app_routes.dart';
import 'package:advance_date_app/config/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
import 'main_page.dart';

const baseUrl = 'https://19oj5.wiremockapi.cloud';

class LoginPage extends StatelessWidget {
  final loginRoute = Uri.parse('$baseUrl/login');
  var username = '';
  var password = '';
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      //     AppBar(title: Text('Login Page'), backgroundColor: Colors.blue[900]),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                Text(
                  AppStrings.helloWelcome,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                TextField(
                  onChanged: (value) {
                    username = value;
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: AppStrings.username,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: AppStrings.password,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print('Clicked');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Forgot Password?'),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final user = await doLogin();
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return MainPage(user: user);
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.amber,
                    ),
                    child: Text('Login'),
                  ),
                ),
                Spacer(),
                Text(
                  'Or sign in with',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Google is clicked');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Login with Google',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.icFacebook,
                          width: 22,
                          height: 22,
                        ),
                        SizedBox(width: 12),
                        Text('Login with Facebook'),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<User> doLogin() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final body = {'username': username, 'password': password};
    final response = await http.post(
      loginRoute,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      final user = User.fromJson(json['data']);
      return user;
    } else {
      print('Login failed');
      throw Exception('Failed to login');
    }
  }
}
