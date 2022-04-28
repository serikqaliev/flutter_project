import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.placeholder,
  }) : super(key: key);

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: const BoxDecoration(color: AppColors.white),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      placeholder: placeholder,
    );
  }
}
