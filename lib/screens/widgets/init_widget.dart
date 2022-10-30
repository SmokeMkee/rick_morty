import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/bloc/episodes/bloc_episodes.dart';
import 'package:lesson3/bloc/episodes/events.dart';
import 'package:lesson3/bloc/persons/bloc_persons.dart';
import 'package:lesson3/repo/api.dart';
import 'package:lesson3/repo/repo_episodes.dart';
import 'package:lesson3/repo/repo_location.dart';
import 'package:lesson3/repo/repo_persons.dart';
import 'package:lesson3/repo/repo_settings.dart';
import 'package:provider/provider.dart';

import '../../bloc/location/bloc_location.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        Provider(
          create: (context) => RepoSettings(),
        ),
        Provider(
          create: (context) => RepoPersons(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoLocation(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        Provider(
          create: (context) => RepoEpisodes(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => BlocPersons(
            repo: RepositoryProvider.of<RepoPersons>(context),
          )..add(
              EventPersonsFilterByName(''),
            ),
        ),
        BlocProvider(
          create: (context) => BlocLocation(
            repo: RepositoryProvider.of<RepoLocation>(context),
          )..add(
              EventLocationFetch(''),
            ),
        ),
        BlocProvider(
          create: (context) => BlocEpisodes(
            repoEpisodes: RepositoryProvider.of<RepoEpisodes>(context),
          )..add(
              EventEpisodesFetch(),
            ),
        ),
      ], child: child),
    );
  }
}
