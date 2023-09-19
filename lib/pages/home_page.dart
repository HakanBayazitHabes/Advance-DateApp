import 'package:advance_date_app/Component/post_item.dart';
import 'package:advance_date_app/Component/toolbar.dart';
import 'package:advance_date_app/styles/app_colors.dart';
import 'package:advance_date_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      appBar: Toolbar(
        title: 'Home Page',
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/ic_location.svg'),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(
            user: users[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 24,
          );
        },
        itemCount: users.length,
      ),
    );
  }

  mockUsersFromServer() {
    for (int i = 0; i < 100; i++) {
      users.add('User number ${i}');
    }
  }
}
