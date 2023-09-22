import 'package:advance_date_app/Component/post_item.dart';
import 'package:advance_date_app/Component/toolbar.dart';
import 'package:advance_date_app/config/app_routes.dart';
import 'package:advance_date_app/config/app_strings.dart';
import 'package:advance_date_app/styles/app_colors.dart';
import 'package:advance_date_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/post_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.appName,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.nearby);
            },
            icon: SvgPicture.asset('assets/svg/ic_location.svg'),
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return PostItem(
                post: value.list[index],
              );
            },
            itemCount: value.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 24,
              );
            },
          );
        },
      ),
    );
  }
}
