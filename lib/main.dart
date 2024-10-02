import 'package:flutter/material.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';
import 'package:messaging_app/discoverPage/discoverPageMain.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DiscoverPageMain(),
      ),
    );
  }
}
