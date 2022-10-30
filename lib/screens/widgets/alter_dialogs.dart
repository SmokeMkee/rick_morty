import 'package:flutter/material.dart';
import 'package:lesson3/constants/app_colors.dart';

import '../../../constants/app_styles.dart';
import '../../../generated/l10n.dart';

class AlertDialogs extends StatelessWidget {
  const AlertDialogs(
      {Key? key, required this.errorText, required this.contentText})
      : super(key: key);
  final String errorText;
  final String contentText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        errorText,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: Text(contentText),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 24),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(
                          width: 2,
                          color: AppColors.alterDialogButtonBorderColor),
                    ),
                  ),
                ),
                child: Text(
                  S.of(context).close,
                  style: AppStyles.s16w500
                      .copyWith(color: AppColors.alterDialogTextColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
