import 'package:flutter/material.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';
import 'package:movies/widgets/default_text_form_field.dart';

class UpdateProfileFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final VoidCallback onResetPassword;

  const UpdateProfileFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.onResetPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: 'Name',
            controller: nameController,
            prefixIconImageName: 'user',
            prefixIconSize: const Size(30, 30),
          ),
          const SizedBox(height: 19),
          DefaultTextFormField(
            hintText: 'Phone',
            controller: phoneController,
            prefixIconImageName: 'phone',
            prefixIconSize: const Size(25, 25),
          ),
          const SizedBox(height: 42),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: onResetPassword,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.white,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Reset Password',
                style: AppTextStyles.textTheme.titleLarge?.copyWith(
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
