// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'bloc/log_in_bloc.dart';
import '../../router/router_const.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/padding_constants.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/text_field_divider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              child: BlocConsumer<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LogInLoaded) {
                    Navigator.pushReplacementNamed(context, HomeRoute);
                  } else if (state is LogInFailed) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text(state.message ?? ''),
                          actions: [
                            CupertinoButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    title: 'Войти',
                    onPressed: state is LogInLoading
                        ? null
                        : () {
                            context.read<LogInBloc>().add(
                                  LogInPressed(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                  );
                },
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButton(
                title: 'Зарегистрироваться',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
