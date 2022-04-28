// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Регистрация'),
      ),
      child: SafeArea(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                    placeholder: 'Логин',
                  ),
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                    placeholder: 'Телефон',
                  ),
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                    placeholder: 'Почта',
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
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: CupertinoButton(
                      color: Color(0xFF4631D2),
                      child: Text('Создать аккаунт'),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
