import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Профиль'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Center(
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                child: Image.asset(
                  'assets/images/profilepic.png',
                  fit: BoxFit.contain,
                  height: 64,
                ),
              ),
            ),
            const SizedBox(height: 9),
            const Text(
              'Акжол Сериккалиев',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              'serikqaliyev@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF929292),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            CupertinoButton(
                color: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 29,
                  vertical: 21,
                ),
                child: const Text(
                  'Выйти',
                  style: TextStyle(
                    color: Color(0xFFEC3A4D),
                  ),
                ),
                alignment: Alignment.centerLeft,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
