import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';

class MoviePosterCard extends StatelessWidget {
  final String imagePath;
  final double rating;

  const MoviePosterCard({
    super.key,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 9.76,
            top: 12.69,
            child: _RatingBadge(rating: rating),
          ),
        ],
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;

  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.608,
      height: 27.328,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.71),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                rating.toStringAsFixed(1),
                style: AppTextStyles.textTheme.titleMedium?.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                  height: 1.2,
                ),
              ),
            ),
          ),
          Image.asset(
            AppAssets.star,
            width: 14.64,
            height: 14.64,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
