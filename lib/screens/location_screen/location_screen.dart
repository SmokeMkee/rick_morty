import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/screens/location_screen/widgets/location_list.dart';

import '../../bloc/location/bloc_location.dart';
import '../../bloc/location/states.dart';
import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';
import '../widgets/alter_dialogs.dart';
import '../widgets/not_found_widget.dart';
import '../widgets/search_field.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);
  String? name = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchField(
                      onChanged: (value) {
                        name = value;
                        BlocProvider.of<BlocLocation>(context).add(
                          EventLocationFetch(value),
                        );
                      },
                      controller: name,
                      title: S.of(context).searchLocation,
                    ),
                    BlocBuilder<BlocLocation, StateBlocLocation>(
                      builder: (context, state) {
                        var locationTotal = 0;
                        if (state is StateLocationData) {
                          locationTotal = state.data.length;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            S.of(context).totalLocation +
                                locationTotal.toString(),
                            style: AppStyles.s210w500,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<BlocLocation, StateBlocLocation>(
                      buildWhen: (prevState, nextState) {
                        if (prevState.runtimeType != nextState.runtimeType) {
                          return true;
                        } else {
                          final prevDataLength = prevState.mapOrNull(
                            data: (state) => state.data.length,
                          );
                          final nextDataLength = nextState.mapOrNull(
                            data: (state) => state.data.length,
                          );
                          return prevDataLength != nextDataLength;
                        }
                      },
                      builder: (context, state) {
                        // int count = 0;
                        // print(count++);
                        return state.map(
                          initial: (_) => const SizedBox.shrink(),
                          loading: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          error: (state) => NotFoundWidget(
                            notFoundText: S.of(context).locationNotFound,
                          ),
                          data: (state) {
                            if (state.data.isEmpty) {
                              return Row(
                                children: [Text(S.of(context).listIsEmpty)],
                              );
                            } else {
                              return Flexible(
                                child: LocationList(
                                  location: state.data,
                                  name: name!,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              BlocConsumer<BlocLocation, StateBlocLocation>(
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
        ),
      ),
    );
  }
}
