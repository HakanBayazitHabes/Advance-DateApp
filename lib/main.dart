import 'package:advance_date_app/config/app_routes.dart';
import 'package:advance_date_app/pages/edit_profile_page.dart';
import 'package:advance_date_app/pages/home_page.dart';
import 'package:advance_date_app/pages/main_page.dart';
import 'package:advance_date_app/provider/app_repo.dart';
import 'package:advance_date_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';
import 'pages/login_page.dart';

void main() {
  runApp(ChangeNotifierProvider<AppRepo>(
      create: (context) => AppRepo(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.pages,
    );
  }
}
