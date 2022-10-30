import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/screens/episode_screen/widgets/episode_card.dart';

import '../../../bloc/episodes/bloc_episodes.dart';
import '../../../bloc/episodes/events.dart';
import '../../../generated/l10n.dart';
import '../../../models/episode.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({Key? key, required this.episodeList}) : super(key: key);

  final List<Episode> episodeList;
  @override
  Widget build(BuildContext context) {
    if (episodeList.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(S.of(context).listIsEmpty),
          ),
        ],
      );
    } else {
      return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<BlocEpisodes>(context).add(
            EventEpisodesFetch(),
          );
        },
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollNotification) {
              if (notification.metrics.extentAfter == 0) {
                BlocProvider.of<BlocEpisodes>(context).add(
                  EventEpisodesNextPage(),
                );
              }
            }
            return false;
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
            ),
            itemCount: episodeList.length,
            itemBuilder: (context, index) =>
                EpisodeCard(episode: episodeList[index]),
          ),
        ),
      );
    }
  }
}
