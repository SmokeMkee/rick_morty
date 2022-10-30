part of '../bloc_episodes.dart';

extension Fetch on BlocEpisodes {
  Future<void> _fetch(
    EventEpisodesFetch eventEpisodesFetch,
    Emitter<StateBlocEpisodes> emit,
  ) async {
    emit(const StateBlocEpisodes.loading());
    final result = await repoEpisodes.fetch();
    if (result.errorMessage != null) {
      emit(
        StateBlocEpisodes.error(result.errorMessage!),
      );
      return;
    }
    emit(
      StateBlocEpisodes.data(data: result.episodeList!),
    );
    _currentPage = 1;
    _isEndOfData = false;
  }
}
