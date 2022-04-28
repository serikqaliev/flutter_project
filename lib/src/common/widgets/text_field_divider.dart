import 'package:flutter/cupertino.dart';

class TextFieldDivider extends StatelessWidget {
  const TextFieldDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0xFFE0E6ED),
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
