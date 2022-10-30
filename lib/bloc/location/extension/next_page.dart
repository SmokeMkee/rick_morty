part of '../bloc_location.dart';

extension NextPage on BlocLocation {
  Future<void> _nextPage(
    EventLocationNextPage event,
    Emitter<StateBlocLocation> emit,
  ) async {
    if (_isEndOfData) return;
    if (_isInProgress) return;
    _isInProgress = true;
    final currentData = state.maybeMap(
      data: (value) => value.data,
      orElse: () => <Location>[],
    );
    emit(
      StateBlocLocation.data(
        data: currentData,
        isLoading: true,
      ),
    );
    final result = await repo.nextPage(_currentPage + 1, event.name);
    if (result.errorMessage != null) {
      emit(
        StateBlocLocation.data(
          data: currentData,
        ),
      );
      return;
    }
    emit(
      StateBlocLocation.data(
        data: [...currentData, ...result.locationList!],
      ),
    );
    _currentPage++;
    _isEndOfData = result.isEndOfData!;
    _isInProgress = false;
  }
}
