import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;

  const AppTextField({super.key, required this.hint, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        labelStyle: TextStyle(
          color: AppColors.white,
        ),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        filled: true,
        fillColor: AppColors.fieldColor,
      ),
    );
  }
}
