// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/screens/auth/auth_screen.dart';
import 'package:lesson_1/src/screens/feed/feed_screen.dart';
import 'package:lesson_1/src/screens/registration/registration_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.map)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return FeedScreen();
              case 1:
                return RegistrationScreen();
              case 2:
                return AuthScreen();
              case 3:
                return RegistrationScreen();
              default:
                return AuthScreen();
            }
          },
        );
      },
    );
  }
}
