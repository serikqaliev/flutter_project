import 'package:flutter/cupertino.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Map'),
      ),
      child: Text(
        'Map Screen',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
