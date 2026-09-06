import 'package:flutter/material.dart';
import 'package:movies/features/profile/presentation/widgets/movie_poster_card.dart';

class MovieGrid extends StatelessWidget {
  final List<String> posterPaths;

  const MovieGrid({
    super.key,
    required this.posterPaths,
  });

  static const double _posterWidth = 122;
  static const double _posterHeight = 179.584;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: _posterWidth / _posterHeight,
      ),
      itemCount: posterPaths.length,
      itemBuilder: (context, index) {
        return MoviePosterCard(
          imagePath: posterPaths[index],
          rating: 7.7,
        );
      },
    );
  }
}
