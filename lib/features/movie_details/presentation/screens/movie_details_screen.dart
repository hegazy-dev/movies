import 'package:flutter/material.dart';

import '../../../../core/network/api_client.dart';
import '../../../data/data_sources/move_remote_data_source.dart';
import '../../../data/repositories/movie_repository.dart';
import '../view_models/movie_details_view_model.dart';
import '../../../../core/state/ui_state.dart';
import 'package:movies/shared/widgets/movie_card.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = MovieDetailsViewModel(
      repository: MovieRepository(
        remoteDataSource: MovieRemoteDataSource(apiClient: ApiClient()),
      ),
      movieId: widget.movieId,
    );

    viewModel.loadMovieDetails();
    viewModel.loadMovieSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final detailsState = viewModel.detailsState;
          final suggestionsState = viewModel.suggestionsState;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Details Section
                _buildDetailsSection(detailsState),

                const SizedBox(height: 24),

                // 2. Suggestions Section
                _buildSuggestionsSection(suggestionsState),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailsSection(UiState detailsState) {
    if (detailsState.status == UiStateStatus.loading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (detailsState.status == UiStateStatus.error) {
      return SizedBox(
        height: 200,
        child: Center(child: Text('Error: ${detailsState.errorMessage}')),
      );
    } else if (detailsState.status == UiStateStatus.success) {
      final movie = detailsState.data!;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${movie.title}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Summary: ${movie.summary}'),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildSuggestionsSection(UiState suggestionsState) {
    if (suggestionsState.status == UiStateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (suggestionsState.status == UiStateStatus.empty) {
      return const Center(child: Text('No suggestions available.'));
    } else if (suggestionsState.status == UiStateStatus.error) {
      return Center(child: Text('Error: ${suggestionsState.errorMessage}'));
    } else if (suggestionsState.status == UiStateStatus.success) {
      final suggestions = suggestionsState.data!;
      final Size screenSize = MediaQuery.sizeOf(context);

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Suggestions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: screenSize.height * 0.20,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: suggestions.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final movie = suggestions[index];

                  return SizedBox(
                    width: screenSize.width * 0.35,
                    child: MovieCard(
                      imageUrl: movie.mediumCoverImage.isNotEmpty
                          ? movie.mediumCoverImage
                          : 'assets/images/card.png',
                      rating: movie.rating,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
