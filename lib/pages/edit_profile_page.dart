import 'package:advance_date_app/Component/app_text_field.dart';
import 'package:advance_date_app/Component/toolbar.dart';
import 'package:flutter/material.dart';

import '../config/app_strings.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.editProfile,
      ),
      body: Column(children: [
        AppTextField(hint: 'First name'),
        AppTextField(hint: 'Last Name'),
        AppTextField(hint: 'Phone Number'),
        AppTextField(hint: 'Location'),
      ]),
    );
  }
}
