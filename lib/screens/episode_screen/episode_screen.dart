import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/constants/app_styles.dart';
import 'package:lesson3/screens/episode_screen/widgets/episode_list.dart';
import 'package:lesson3/screens/widgets/not_found_widget.dart';

import '../../bloc/episodes/bloc_episodes.dart';
import '../../bloc/episodes/states.dart';
import '../../generated/l10n.dart';
import '../widgets/alter_dialogs.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          S.of(context).episode,
          style: AppStyles.s16w400.copyWith(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<BlocEpisodes, StateBlocEpisodes>(
                    builder: (context, state) {
                      return state.map(
                        initial: (_) => const SizedBox.shrink(),
                        loading: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        data: (state) => EpisodeList(episodeList: state.data),
                        error: (state) =>
                            const NotFoundWidget(notFoundText: 'Not found'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          BlocConsumer<BlocEpisodes, StateBlocEpisodes>(
            builder: (context, state) {
              final isLoading = state.maybeMap(
                data: (state) => state.isLoading,
                orElse: () => false,
              );

              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: isLoading
                    ? const LinearProgressIndicator()
                    : const SizedBox.shrink(),
              );
            },
            listener: (context, state) {
              state.mapOrNull(
                data: (state) {
                  if (state.errorMessage != null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogs(
                          errorText: state.errorMessage!,
                          contentText: state.errorMessage!,
                        );
                      },
                    );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
