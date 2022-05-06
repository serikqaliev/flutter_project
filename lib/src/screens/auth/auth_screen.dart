// ignore_for_file: prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/common/constants/padding_constants.dart';
import 'package:lesson_1/src/common/widgets/custom_button.dart';
import 'package:lesson_1/src/common/widgets/custom_text_field.dart';
import 'package:lesson_1/src/common/widgets/text_field_divider.dart';
import 'package:lesson_1/src/router/router_const.dart';
import 'package:lesson_1/src/screens/registration/registration_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Dio dio = Dio();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            CustomTextField(
              placeholder: 'Логин или почта',
              controller: emailController,
            ),
            TextFieldDivider(),
            CustomTextField(
              placeholder: 'Пароль',
              controller: passwordController,
            ),
            SizedBox(height: 32),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButton(
                title: 'Войти',
                onPressed: () async {
                  try {
                    Response response = await dio.post(
                      'http://api.codeunion.kz/api/v1/auth/login',
                      data: {
                        "email": emailController.text,
                        "password": passwordController.text,
                      },
                    );

                    print(response.data["accessToken"]);
                    Navigator.pushReplacementNamed(context, HomeRoute);
                  } on DioError catch (e) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text(e.response!.data['message']),
                          actions: [
                            CupertinoButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        );
                      },
                    );
                    rethrow;
                  }
                },
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButton(
                title: 'Зарегистрироваться',
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return RegistrationScreen();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
