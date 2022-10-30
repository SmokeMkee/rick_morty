import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lesson3/constants/app_assets.dart';
import 'package:lesson3/repo/repo_settings.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey[50],
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(
      () async {
        var defaultLocale = const Locale('ru', 'RU');
        final locale = await repoSettings.readLocale();
        if (locale == 'en') {
          defaultLocale = const Locale('en');
        }
        S.load(defaultLocale).whenComplete(
          () {
            Navigator.of(context).pushReplacementNamed('/auth_screen');
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.images.bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(AppAssets.images.logo),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(AppAssets.images.morty),
                ),
                Expanded(
                  child: Image.asset(AppAssets.images.rick),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
