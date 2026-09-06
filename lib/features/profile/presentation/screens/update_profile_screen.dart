import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/features/profile/domain/profile_update_result.dart';
import 'package:movies/features/profile/presentation/widgets/avatar_picker.dart';
import 'package:movies/features/profile/presentation/widgets/update_profile_form.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_text_styles.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String name;
  final String phone;
  final int avatarIndex;

  const UpdateProfileScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.avatarIndex,
  });

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late int _selectedAvatarIndex;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _selectedAvatarIndex = widget.avatarIndex;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _updateData() {
    Navigator.pop(
      context,
      ProfileUpdateResult(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        avatarIndex: _selectedAvatarIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pick Avatar',
          style: AppTextStyles.textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            height: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _openAvatarPicker,
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.avatars[_selectedAvatarIndex],
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    UpdateProfileFields(
                      nameController: _nameController,
                      phoneController: _phoneController,
                      onResetPassword: () {},
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Future<void> _openAvatarPicker() async {
    final selected = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: AppColors.surface,
      barrierColor: AppColors.background.withValues(alpha: 0.7),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: AvatarPicker(
            selectedIndex: _selectedAvatarIndex,
            onAvatarSelected: (index) => Navigator.pop(context, index),
          ),
        );
      },
    );

    if (selected != null && mounted) {
      setState(() {
        _selectedAvatarIndex = selected;
      });
    }
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.white,
              ),
              child: Text(
                'Delete Account',
                style: AppTextStyles.textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                  height: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 19),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _updateData,
              child: Text(
                'Update Data',
                style: AppTextStyles.textTheme.titleLarge?.copyWith(
                  color: AppColors.background,
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
