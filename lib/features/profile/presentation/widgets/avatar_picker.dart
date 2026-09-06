import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/theme/app_colors.dart';

class AvatarPicker extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onAvatarSelected;

  const AvatarPicker({
    super.key,
    required this.selectedIndex,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 19, 19, 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 19,
          mainAxisSpacing: 19,
          childAspectRatio: 108 / 105,
        ),
        itemCount: AppAssets.avatars.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onAvatarSelected(index),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.56)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary),
              ),
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 9),
              child: Image.asset(
                AppAssets.avatars[index],
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
