import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final int wishListCount;
  final int historyCount;
  final String? avatarPath;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.wishListCount,
    required this.historyCount,
    this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final avatarSize = (width * 0.274).clamp(88.0, 118.0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  avatarPath ?? AppAssets.defaultAvatar,
                  width: avatarSize,
                  height: avatarSize,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _StatItem(
                        count: wishListCount,
                        label: 'Wish List',
                      ),
                    ),
                    Expanded(
                      child: _StatItem(
                        count: historyCount,
                        label: 'History',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final int count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: AppTextStyles.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: AppTextStyles.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
