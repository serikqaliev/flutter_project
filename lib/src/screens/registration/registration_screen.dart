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
                  CustomTextField(
                    placeholder: 'Логин',
                  ),
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CustomTextField(placeholder: 'Телефон'),
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CustomTextField(placeholder: 'Почта'),
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CustomTextField(placeholder: 'Пароль'),
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
                    child: CustomButton(
                      title: 'Создать аккаунт',
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

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color(0xFF4631D2),
      child: Text(title),
      onPressed: () {},
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.placeholder,
  }) : super(key: key);

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(color: CupertinoColors.white),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      placeholder: placeholder,
    );
  }
}
