import 'package:advance_date_app/Component/chat_me_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_repo.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppRepo>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final chat = provider.chats[index];
          if(chat.user.id == provider.user?.id) {
            return ChatMeItem(chat: chat);
          }
          return ChatMeItem(chat: chat);
        },
        itemCount: provider.chats.length,
      ),
    );
  }
}
