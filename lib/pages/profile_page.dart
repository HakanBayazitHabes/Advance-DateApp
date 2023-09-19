import 'package:advance_date_app/Component/toolbar.dart';
import 'package:advance_date_app/styles/app_text.dart';
import 'package:flutter/material.dart';

enum ProfileMenu { edit, settings, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Profile',
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  print('edit');
                  break;
                case ProfileMenu.settings:
                  print('settings');
                  break;
                case ProfileMenu.logout:
                  print('logout');
                  break;
                default:
              }
            },
            icon: const Icon(Icons.more_vert_rounded),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Edit Profile'),
                  value: ProfileMenu.edit,
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                  value: ProfileMenu.settings,
                ),
                PopupMenuItem(
                  child: Text('Logout'),
                  value: ProfileMenu.logout,
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset(
              'assets/temp/user1.png',
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Mahdi Yusuf',
            style: AppText.header2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Madacascar',
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '472',
                    style: AppText.header2,
                  ),
                  Text('Followers'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '860',
                    style: AppText.header2,
                  ),
                  Text('Following'),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            endIndent: 24,
            indent: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
