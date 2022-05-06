// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';

import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/screens/auth/auth_screen.dart';
import 'package:lesson_1/src/screens/favourites/favourites_screen.dart';
import 'package:lesson_1/src/screens/feed/feed_screen.dart';
import 'package:lesson_1/src/screens/map/map_screen.dart';
import 'package:lesson_1/src/screens/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() => Future.value(false)),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: AppColors.main,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Лента'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map), label: 'Карта'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: 'Избранные'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'Профиль'),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return FeedScreen();
                case 1:
                  return MapScreen();
                case 2:
                  return FavouritesScreen();
                case 3:
                  return ProfileScreen();
                default:
                  return AuthScreen();
              }
            },
          );
        },
      ),
    );
  }
}
