import 'dart:io';

import 'package:advance_date_app/Component/app_text_field.dart';
import 'package:advance_date_app/provider/app_repo.dart';
import 'package:advance_date_app/styles/app_colors.dart';
import 'package:advance_date_app/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/post_provider.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            'Insert Message',
            style: AppText.header1,
          ),
          SizedBox(
            height: 16,
          ),
          AppTextField(
            hint: 'Message...',
            onChanged: (value) {
              context.read<PostProvider>().message = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Add Image',
            style: AppText.header1,
          ),
          SizedBox(
            height: 16,
          ),
          Consumer<PostProvider>(
            builder: (context, value, child) => GestureDetector(
              onTap: () {
                context.read<PostProvider>().pickImage(ImageSource.gallery);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: value.imagePath == null
                    ? Center(
                        child: Text('Upload from gallery'),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            Image.file(File(value.imagePath!)),
                            IconButton(
                                onPressed: () {
                                  value.deleteImage();
                                },
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ))
                          ],
                        )),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Or"),
          SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Camera'),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<PostProvider>()
                  .createPost(context.read<AppRepo>().token!)
                  .then((value) {
                Navigator.pop(context);
              });
            },
            child: Text('Create Post'),
          ),
        ],
      ),
    );
  }
}
