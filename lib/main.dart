// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/router/router.dart';
import 'package:lesson_1/src/screens/auth/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
    );
  }
}
