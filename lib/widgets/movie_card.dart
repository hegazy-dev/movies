import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class MovieCard extends StatelessWidget {
  String imageUrl;
  double rating;

  MovieCard({required this.imageUrl, required this.rating});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.network(imageUrl, width: 130, height: 180, fit: BoxFit.cover),

          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.background.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: AppColors.primary, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
