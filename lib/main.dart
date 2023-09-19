import 'package:advance_date_app/pages/home_page.dart';
import 'package:advance_date_app/pages/main_page.dart';
import 'package:advance_date_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.light,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/main': (context) => MainPage(),
        });
  }
}
