import 'package:flutter/material.dart';

import '../../../../core/state/ui_state.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repositories/movie_repository.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  final MovieRepository repository;
  final int movieId;

  UiState<MovieModel> detailsState = const UiState.initial();
  UiState<List<MovieModel>> suggestionsState = const UiState.initial();

  MovieDetailsViewModel({required this.repository, required this.movieId});

  Future<void> loadMovieDetails() async {
    detailsState = const UiState.loading();
    notifyListeners();

    try {
      final movie = await repository.getMovieDetails(movieId);
      detailsState = UiState.success(movie);
    } catch (e) {
      detailsState = UiState.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> loadMovieSuggestions() async {
    suggestionsState = const UiState.loading();
    notifyListeners();

    try {
      final suggestions = await repository.getMovieSuggestions(movieId);
      if (suggestions.isEmpty) {
        suggestionsState = const UiState.empty();
      } else {
        suggestionsState = UiState.success(suggestions);
      }
    } catch (e) {
      suggestionsState = UiState.error(e.toString());
    }
    notifyListeners();
  }
}
