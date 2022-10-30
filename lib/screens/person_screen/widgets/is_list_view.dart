import 'package:flutter/material.dart';

import '../../../../constants/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/accounts.dart';

class IsListView extends StatelessWidget {
  const IsListView({Key? key, required this.itemList}) : super(key: key);
  final List<Accounts> itemList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: Image.network(itemList[index].image!).image,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemList[index].status!.contains('Alive')
                        ? Text(
                            S.of(context).statusAlive.toUpperCase(),
                            style: AppStyles.s10w500,
                          )
                        : Text(
                            S.of(context).statusDead.toUpperCase(),
                            style: AppStyles.s10w500Dead,
                          ),
                    Text(
                      itemList[index].name!,
                      style: AppStyles.s16w500,
                    ),
                    itemList[index].gender!.contains('Male')
                        ? Text(
                            S.of(context).genderMan,
                            style: AppStyles.s12w400,
                          )
                        : Text(
                            S.of(context).genderGirl,
                            style: AppStyles.s12w400,
                          ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
