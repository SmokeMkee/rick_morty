import '../models/accounts.dart';
import 'api.dart';

class RepoPersons {
  RepoPersons({required this.api});
  final Api api;
  Future<ResultRepoPersons> filterByName(String name) async {
    try {
      final result = await api.dio.get(
        '/character/',
        queryParameters: {
          "name": name,
        },
      );

      final List personListJson = result.data['results'] ?? [];
      final personList = personListJson
          .map(
            (e) => Accounts.fromJson(e),
          )
          .toList();
      return ResultRepoPersons(
        personsList: personList,
        searchedName: name,
      );
    } catch (error) {
      /* if (kDebugMode) {
        print("Error : $error");
      }*/
      return ResultRepoPersons(errorMessage: 'Error');
    }
  }
}

class ResultRepoPersons {
  ResultRepoPersons({
    this.searchedName,
    this.errorMessage,
    this.personsList,
  });
  final String? searchedName;
  final String? errorMessage;
  final List<Accounts>? personsList;
}
