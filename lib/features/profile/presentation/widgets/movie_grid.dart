import 'package:flutter/material.dart';
import 'package:movies/features/profile/presentation/widgets/movie_poster_card.dart';

class MovieGrid extends StatelessWidget {
  final List<Map<String, dynamic>> movies;

  const MovieGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context),
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MoviePosterCard(
          title: movie['title'] ?? '',
          rating: movie['rating'] ?? 0.0,
          imageUrl: movie['imageUrl'],
        );
      },
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 400) return 2;
    if (width < 600) return 3;
    if (width < 900) return 4;
    return 5;
  }
}
