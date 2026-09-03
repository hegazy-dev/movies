import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';

class ProfileTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const ProfileTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _TabItem(
              icon: SvgPicture.asset(
                AppAssets.watchListIcon,
                width: 33.28,
                height: 19.6,
              ),
              label: 'Watch List',
              onTap: () => onTabChanged(0),
            ),
            _TabItem(
              icon: SvgPicture.asset(
                AppAssets.folderIcon,
                width: 42,
                height: 42,
              ),
              label: 'History',
              onTap: () => onTabChanged(1),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 3,
                color: selectedIndex == 0
                    ? AppColors.primary
                    : Colors.transparent,
              ),
            ),
            Expanded(
              child: Container(
                height: 3,
                color: selectedIndex == 1
                    ? AppColors.primary
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 12),
          child: Column(
            children: [
              SizedBox(
                height: 42,
                child: Center(child: icon),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: AppTextStyles.textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
