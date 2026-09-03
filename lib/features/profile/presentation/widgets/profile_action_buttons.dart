import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';

class ProfileActionButtons extends StatelessWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onExit;

  const ProfileActionButtons({
    super.key,
    required this.onEditProfile,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 253,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: onEditProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.background,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Edit Profile',
                  style: AppTextStyles.textTheme.titleLarge?.copyWith(
                    color: AppColors.background,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 135,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: onExit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Exit',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textTheme.titleLarge?.copyWith(
                          color: AppColors.white,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const _LogoutIcon(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoutIcon extends StatelessWidget {
  const _LogoutIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 19.5,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SvgPicture.asset(
              AppAssets.logoutDoor,
              width: 11.5,
              height: 19.5,
            ),
          ),
          Positioned(
            left: 4.5,
            top: 8.73,
            child: SvgPicture.asset(
              AppAssets.logoutLine,
              width: 13.5,
              height: 1.5,
            ),
          ),
          Positioned(
            left: 12.4,
            top: 5.13,
            child: SvgPicture.asset(
              AppAssets.logoutChevron,
              width: 5.1,
              height: 8.7,
            ),
          ),
        ],
      ),
    );
  }
}
