import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/episode.dart';
part 'states.freezed.dart';

@freezed
class StateBlocEpisodes with _$StateBlocEpisodes {
  const factory StateBlocEpisodes.data(
      {required List<Episode> data,
      @Default(false) bool isLoading,
      String? errorMessage}) = StateEpisodesData;

  const factory StateBlocEpisodes.initial() = StateEpisodeInitial;
  const factory StateBlocEpisodes.loading() = StateEpisodeLoading;
  const factory StateBlocEpisodes.error(String error) = StateEpisodeError;
}
