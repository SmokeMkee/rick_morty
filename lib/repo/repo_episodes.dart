import '../models/episode.dart';
import 'api.dart';

class RepoEpisodes {
  final Api api;

  RepoEpisodes({required this.api});

  Future<ResultRepoEpisodes> fetch() => nextPage(1);
  Future<ResultRepoEpisodes> nextPage(int page) async {
    try {
      final result = await api.dio.get(
        '/episode?page=$page',
      );

      final bool isEndOfData = result.data['info']['next'] == null;

      final List json = result.data['results'] ?? [];
      final list = json.map((e) => Episode.fromJson(e));
      return ResultRepoEpisodes(
          isEndOfData: isEndOfData, episodeList: list.toList());
    } catch (error) {
      return ResultRepoEpisodes(errorMessage: "Error");
    }
  }
}

class ResultRepoEpisodes {
  ResultRepoEpisodes({
    this.errorMessage,
    this.isEndOfData,
    this.episodeList,
  });

  final bool? isEndOfData;
  final String? errorMessage;
  final List<Episode>? episodeList;
}
