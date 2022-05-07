import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.main,
      child: Text(
        title!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
    );
  }
}
