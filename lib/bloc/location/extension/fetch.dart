part of '../bloc_location.dart';

extension Fetch on BlocLocation {
  Future<void> _fetch(
    EventLocationFetch eventEpisodesFetch,
    Emitter<StateBlocLocation> emit,
  ) async {
    emit(const StateBlocLocation.loading());
    final result = await repo.fetch(eventEpisodesFetch.name);
    if (result.errorMessage != null) {
      emit(
        StateBlocLocation.error(result.errorMessage!),
      );
      return;
    }
    emit(
      StateBlocLocation.data(data: result.locationList!),
    );
    _currentPage = 1;
    _isEndOfData = false;
    _isInProgress = false;
  }
}
