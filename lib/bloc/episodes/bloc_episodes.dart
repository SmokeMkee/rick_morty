import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/bloc/episodes/events.dart';
import 'package:lesson3/bloc/episodes/states.dart';
import 'package:lesson3/repo/repo_episodes.dart';

import '../../models/episode.dart';
part 'extension/fetch.dart';
part 'extension/next_page.dart';

class BlocEpisodes extends Bloc<EventBlocEpisodes, StateBlocEpisodes> {
  BlocEpisodes({required this.repoEpisodes})
      : super(const StateBlocEpisodes.initial()) {
    on<EventEpisodesFetch>(_fetch);
    on<EventEpisodesNextPage>(_nextPage);
  }
  final RepoEpisodes repoEpisodes;

  int _currentPage = 1;
  bool _isEndOfData = false;
  bool _isInProgress = false;
}
