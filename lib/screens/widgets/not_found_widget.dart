import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_styles.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key, required this.notFoundText})
      : super(key: key);
  final String notFoundText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.6,
      child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(AppAssets.images.notFound)),
            const SizedBox(
              height: 20,
            ),
            Text(
              notFoundText,
              style: AppStyles.s16w400
                  .copyWith(color: Colors.grey, letterSpacing: 0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
