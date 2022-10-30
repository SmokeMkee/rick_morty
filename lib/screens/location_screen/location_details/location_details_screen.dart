import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';
import '../../../generated/l10n.dart';
import '../../../models/location.dart';
import 'package:intl/intl.dart';

class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({Key? key, required this.location})
      : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              location.name!,
              style: AppStyles.s20w500,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${location.type} * ${location.dimension}',
                    style:
                        AppStyles.s14w400.copyWith(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            Text(
                '${S.of(context).aired}${DateFormat.yMMMMEEEEd().format(location.created!)}'),
          ],
        ),
      ),
    );
  }
}
