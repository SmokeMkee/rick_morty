import 'package:freezed_annotation/freezed_annotation.dart';
part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode {
  const factory Episode({
    int? id,
    String? name,
    String? airDate,
    String? episodeCode,
    List<String>? characters,
    DateTime? created,
  }) = _Episode;

  factory Episode.fromJson(Map<String, Object?> json) => _$EpisodeFromJson(json);
}
