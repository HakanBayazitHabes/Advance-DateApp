import 'package:flutter/material.dart';

import '../data/model/post.dart';
import '../styles/app_text.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/user1.png',
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '${post.owner?.firstname} ${post.owner?.lastname}',
                style: AppText.subtitle3,
              ),
            ],
          ),
          if (post.image != null) ...[
            SizedBox(
              height: 12,
            ),
            Image.asset('assets/temp/post1.jpg'),
          ],
          SizedBox(
            height: 12,
          ),
          Text(post.message ?? '', style: AppText.subtitle3),
        ],
      ),
    );
  }
}
