// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/router/router.dart';
import 'package:lesson_1/src/router/router_const.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AuthRoute;

  @override
  void initState() {
    Box tokensBox = Hive.box('tokens');

    if (tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      initialRoute = HomeRoute;
      debugPrint('open main');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        primaryColor: AppColors.main,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
