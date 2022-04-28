// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/router/router_const.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/text_field_divider.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: AppColors.white,
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
                  SizedBox(height: 32),
                  CustomTextField(placeholder: 'Логин'),
                  TextFieldDivider(),
                  CustomTextField(placeholder: 'Телефон'),
                  TextFieldDivider(),
                  CustomTextField(placeholder: 'Почта'),
                  TextFieldDivider(),
                  CustomTextField(placeholder: 'Пароль'),
                  TextFieldDivider(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: CustomButton(
                      title: 'Создать аккаунт',
                      onPressed: () {
                        //Navigator.pushNamed(context, AuthRoute);
                        Navigator.pushNamedAndRemoveUntil(
                            context, AuthRoute, (route) => false);
                      },
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
