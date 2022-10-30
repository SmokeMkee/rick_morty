import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/bloc/persons/states.dart';
import 'package:lesson3/repo/repo_persons.dart';

part 'events.dart';

class BlocPersons extends Bloc<EventBlocPersons, StateBlocPersons> {
  BlocPersons({required this.repo}) : super(const StateBlocPersons.initial()) {
    on<EventPersonsFilterByName>(
      (event, emit) async {
        emit(const StateBlocPersons.loading());
        final result = await repo.filterByName(event.name);
        if (result.errorMessage != null) {
          emit(
            StateBlocPersons.error(error: result.errorMessage!),
          );
          return;
        }
        emit(
          StateBlocPersons.data(data: result.personsList!),
        );
      },
    );
  }

  final RepoPersons repo;
}
