import 'package:flutter/material.dart';
import 'package:lesson3/models/accounts.dart';

import '../../../../constants/app_styles.dart';
import '../../../../generated/l10n.dart';

class IsGridView extends StatelessWidget {
  const IsGridView({Key? key, required this.itemList}) : super(key: key);
  final List<Accounts> itemList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          mainAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 250,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                maxRadius: 70,
                backgroundImage: Image.network(itemList[index].image!).image,
              ),
              const SizedBox(
                height: 10,
              ),
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
                    )
            ],
          );
        },
      ),
    );
  }
}
