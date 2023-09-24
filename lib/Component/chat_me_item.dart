import 'package:advance_date_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../data/model/chat.dart';

class ChatMeItem extends StatelessWidget {
  final Chat chat;

  const ChatMeItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Text(
        chat.message,
        style: TextStyle(
          color: AppColors.black,
        ),
      ),
    );
  }
}
