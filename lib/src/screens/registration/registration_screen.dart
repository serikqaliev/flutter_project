// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import 'package:lesson_1/src/router/router_const.dart';
import 'package:lesson_1/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:lesson_1/src/screens/registration/bloc/registration_bloc.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/text_field_divider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();

  final nicknameController = TextEditingController();

  final phoneController = TextEditingController();

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
                  placeholder: 'Почта',
                  controller: emailController,
                ),
                TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Логин',
                  controller: nicknameController,
                ),
                TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Телефон',
                  controller: phoneController,
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
                  child: BlocConsumer<RegistrationBloc, RegistrationState>(
                    listener: (context, state) {
                      if (state is RegistrationLoaded) {
                        Navigator.pushReplacementNamed(context, HomeRoute);
                      } else if (state is RegistrationFailed) {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text('Ошибка'),
                              content: Text(state.message),
                              actions: [
                                CupertinoButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        title: 'Создать аккаунт',
                        onPressed: state is RegistrationLoading
                            ? null
                            : () {
                                context.read<RegistrationBloc>().add(
                                      RegistrationPressed(
                                        email: emailController.text,
                                        nickname: nicknameController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              },
                      );
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
