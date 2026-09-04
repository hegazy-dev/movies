import 'package:flutter/material.dart';
import 'package:movies/theme/app_colors.dart';

class MoviePosterCard extends StatelessWidget {
  final String title;
  final double rating;
  final String? imageUrl;

  const MoviePosterCard({
    super.key,
    required this.title,
    required this.rating,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          imageUrl != null
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _PlaceholderImage(title: title);
                  },
                )
              : _PlaceholderImage(title: title),
          Positioned(
            left: 8,
            bottom: 8,
            child: _RatingBadge(rating: rating),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  final String title;

  const _PlaceholderImage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.star,
            color: AppColors.primary,
            size: 14,
          ),
        ],
      ),
    );
  }
}
