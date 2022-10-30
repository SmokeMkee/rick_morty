import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson3/constants/app_assets.dart';
import 'package:lesson3/constants/app_colors.dart';
import 'package:lesson3/generated/l10n.dart';
import 'package:lesson3/screens/episode_screen/episode_screen.dart';
import 'package:lesson3/screens/settings_screen/settings_screen.dart';
import '../location_screen/location_screen.dart';
import '../person_screen/person_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedPage = 0;

  void onSelectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const PersonScreen(),
    LocationScreen(),
    const EpisodeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svg.personsIcon,
                color: _selectedPage == 0
                    ? AppColors.selectedBottomItem
                    : AppColors.unselectedBottomItem),
            label: S.of(context).persons,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svg.location,
                color: _selectedPage == 1
                    ? AppColors.selectedBottomItem
                    : AppColors.unselectedBottomItem),
            label: S.of(context).location,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svg.episode,
                color: _selectedPage == 2
                    ? AppColors.selectedBottomItem
                    : AppColors.unselectedBottomItem),
            label: S.of(context).episode,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svg.settingsIcon,
                color: _selectedPage == 3
                    ? AppColors.selectedBottomItem
                    : AppColors.unselectedBottomItem),
            label: S.of(context).settings,
          ),
        ],
        onTap: onSelectPage,
      ),
    );
  }
}
