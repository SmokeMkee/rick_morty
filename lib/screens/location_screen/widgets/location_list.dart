import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/bloc/location/bloc_location.dart';
import 'package:lesson3/constants/app_styles.dart';
import 'package:lesson3/models/location.dart';

import '../../../generated/l10n.dart';
import '../location_details/location_details_screen.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key, required this.location, required this.name})
      : super(key: key);

  final List<Location> location;
  final String name;
  @override
  Widget build(BuildContext context) {
    if (location.isEmpty) {
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
          BlocProvider.of<BlocLocation>(context).add(
            EventLocationFetch(name),
          );
        },
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollNotification) {
              if (notification.metrics.extentAfter == 0) {
                BlocProvider.of<BlocLocation>(context).add(
                  EventLocationNextPage(name),
                );
              }
            }
            return false;
          },
          child: ListView.separated(
            itemCount: location.length,
            itemBuilder: (context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationDetailsScreen(
                        location: location[index],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            location[index].type!,
                            style: AppStyles.s16w500
                                .copyWith(color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            location[index].name!,
                            style: AppStyles.s20w500,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            location[index].dimension!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 1,
                thickness: 1,
              );
            },
          ),
        ),
      );
    }
  }
}
