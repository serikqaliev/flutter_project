// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  foo() {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
      navigationBar: const CupertinoNavigationBar(
        border: Border(),
        backgroundColor: CupertinoColors.white,
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CupertinoTextField(
              decoration: BoxDecoration(color: CupertinoColors.white),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              placeholder: 'Логин или почта',
            ),
            Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            CupertinoTextField(
              decoration: BoxDecoration(color: CupertinoColors.white),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              placeholder: 'Пароль',
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Color(0xFF4631D2),
                child: Text(
                  'Войти',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Color(0xFF4631D2),
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
