import 'package:flutter_test/flutter_test.dart';
import 'package:movies/core/state/ui_state.dart';

void main() {
  test('UiState should create different states correctly', () {
    const initial = UiState<String>.initial();
    expect(initial.status, UiStateStatus.initial);
    expect(initial.data, isNull);
    expect(initial.errorMessage, isNull);

    const loading = UiState<String>.loading();
    expect(loading.status, UiStateStatus.loading);

    const success = UiState<String>.success('Movie App');
    expect(success.status, UiStateStatus.success);
    expect(success.data, 'Movie App');

    const empty = UiState<String>.empty();
    expect(empty.status, UiStateStatus.empty);

    const error = UiState<String>.error('Something went wrong');
    expect(error.status, UiStateStatus.error);
    expect(error.errorMessage, 'Something went wrong');
  });
}