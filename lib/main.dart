import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lesson3/screens/login_screen/auth_screen.dart';
import 'package:lesson3/screens/widgets/nav_bar.dart';
import 'package:lesson3/screens/widgets/init_widget.dart';
import 'package:lesson3/repo/repo_settings.dart';
import 'package:lesson3/screens/splash_screen/splash_screen.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repoSettings = RepoSettings();
  await repoSettings.init();
  var defaultLocale = const Locale('ru', 'RU');
  final locale = await repoSettings.readLocale();
  if (locale == 'en') {
    defaultLocale = const Locale('en');
  }

  runApp(
    MyApp(
      locale: defaultLocale,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.locale}) : super(key: key);
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/auth_screen': (context) => const AuthScreen(),
          '/auth_screen/nav_bar': (context) => const NavBar(),
        },
        initialRoute: '/splash_screen',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
