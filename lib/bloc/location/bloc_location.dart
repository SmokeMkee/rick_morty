import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/bloc/location/states.dart';
import 'package:lesson3/models/location.dart';

import '../../repo/repo_location.dart';
part 'events.dart';
part 'extension/fetch.dart';
part 'extension/next_page.dart';

class BlocLocation extends Bloc<EventBlocLocation, StateBlocLocation> {
  BlocLocation({required this.repo})
      : super(const StateBlocLocation.initial()) {
    on<EventLocationFetch>(_fetch);
    on<EventLocationNextPage>(_nextPage);
  }
  int _currentPage = 1;
  bool _isEndOfData = false;
  bool _isInProgress = false;

  final RepoLocation repo;
}
