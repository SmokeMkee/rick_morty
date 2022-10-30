import 'package:lesson3/models/location.dart';

import 'api.dart';

class RepoLocation {
  final Api api;

  RepoLocation({required this.api});

  Future<ResultRepoLocation> fetch(String? name) => nextPage(1, name);

  Future<ResultRepoLocation> nextPage(int page, String? name) async {
    try {
      final result = await api.dio
          .get('/location', queryParameters: {'page': page, 'name': name});

      final bool isEndOfData = result.data['info']['next'] == null;

      final List json = result.data['results'] ?? [];
      final list = json.map((e) => Location.fromJson(e));

      return ResultRepoLocation(
          isEndOfData: isEndOfData, locationList: list.toList());
    } catch (error) {
      return ResultRepoLocation(errorMessage: "Error");
    }
  }
}

class ResultRepoLocation {
  ResultRepoLocation({
    this.isEndOfData,
    this.errorMessage,
    this.locationList,
  });

  final bool? isEndOfData;
  final String? errorMessage;
  final List<Location>? locationList;
}
