import 'package:advance_date_app/Component/app_text_field.dart';
import 'package:advance_date_app/Component/toolbar.dart';
import 'package:advance_date_app/Component/user_avatar.dart';
import 'package:advance_date_app/styles/app_colors.dart';
import 'package:advance_date_app/styles/app_text.dart';
import 'package:flutter/material.dart';

import '../config/app_strings.dart';

enum Gender {
  none,
  male,
  female,
  other,
}

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: AppStrings.editProfile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: UserAvatar(
                    size: 120,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            AppTextField(hint: AppStrings.firstName),
            SizedBox(height: 16),
            AppTextField(hint: AppStrings.lastName),
            SizedBox(height: 16),
            AppTextField(hint: AppStrings.phoneNumber),
            SizedBox(height: 16),
            AppTextField(hint: AppStrings.location),
            SizedBox(height: 16),
            AppTextField(hint: AppStrings.birthday),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
              decoration: BoxDecoration(
                color: AppColors.fieldColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.gender,
                    style: AppText.body1.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text(AppStrings.male),
                          value: Gender.male,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                          ),
                          contentPadding: EdgeInsets.zero,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = Gender.male;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text(AppStrings.female),
                          value: Gender.female,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                          ),
                          contentPadding: EdgeInsets.zero,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = Gender.female;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text(AppStrings.other),
                          value: Gender.other,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                          ),
                          contentPadding: EdgeInsets.zero,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = Gender.other;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
