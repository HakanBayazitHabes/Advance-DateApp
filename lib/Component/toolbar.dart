import 'package:advance_date_app/styles/app_text.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
          style: AppText.header1,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
