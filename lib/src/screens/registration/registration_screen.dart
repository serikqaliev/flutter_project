// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/router/router_const.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/text_field_divider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final loginController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(height: 32),
                CustomTextField(
                  placeholder: 'Логин',
                  controller: loginController,
                ),
                TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Телефон',
                  controller: phoneController,
                ),
                TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Почта',
                  controller: emailController,
                ),
                TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Пароль',
                  controller: passwordController,
                ),
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
                      Navigator.pushNamed(context, AuthRoute);
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
    );
  }
}
