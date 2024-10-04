import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';

class DmPageMain extends StatefulWidget {
  const DmPageMain({super.key});

  @override
  _DmPageMainState createState() => _DmPageMainState();
}

class _DmPageMainState extends State<DmPageMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [Background(), DiscoverPageHeader()],
        ),
      ),
    );
  }
}
