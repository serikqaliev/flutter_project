import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/registration_bloc.dart';
import '../../router/router_const.dart';
import '../../common/constants/color_constants.dart';
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
      navigationBar: const CupertinoNavigationBar(
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
                const SizedBox(height: 32),
                CustomTextField(
                  placeholder: 'Почта',
                  controller: emailController,
                ),
                const TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Логин',
                  controller: nicknameController,
                ),
                const TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Телефон',
                  controller: phoneController,
                ),
                const TextFieldDivider(),
                CustomTextField(
                  placeholder: 'Пароль',
                  controller: passwordController,
                ),
                const TextFieldDivider(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: BlocConsumer<RegistrationBloc, RegistrationState>(
                    listener: (context, state) {
                      if (state is RegistrationLoaded) {
                        Navigator.pushReplacementNamed(context, HomeRoute);
                      } else if (state is RegistrationFailed) {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Ошибка'),
                              content: Text(state.message),
                              actions: [
                                CupertinoButton(
                                  child: const Text('OK'),
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
                const SizedBox(
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
