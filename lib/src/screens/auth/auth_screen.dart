// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/common/constants/padding_constants.dart';
import 'package:lesson_1/src/common/widgets/custom_button.dart';
import 'package:lesson_1/src/common/widgets/custom_text_field.dart';
import 'package:lesson_1/src/common/widgets/text_field_divider.dart';
import 'package:lesson_1/src/router/router_const.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: const CupertinoNavigationBar(
        border: Border(),
        backgroundColor: AppColors.white,
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextField(placeholder: 'Логин или почта'),
            TextFieldDivider(),
            CustomTextField(placeholder: 'Пароль'),
            SizedBox(height: 32),
            Padding(
                padding: AppPaddings.horizontal,
                child: CustomButton(
                  title: 'Войти',
                  onPressed: () {},
                )),
            SizedBox(height: 19),
            Padding(
                padding: AppPaddings.horizontal,
                child: CustomButton(
                  title: 'Зарегистрироваться',
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationRoute);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
