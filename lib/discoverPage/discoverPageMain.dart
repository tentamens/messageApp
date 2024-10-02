import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';

class DiscoverPageMain extends StatefulWidget {
  const DiscoverPageMain({Key? key}) : super(key: key);

  @override
  _DiscoverPageMainState createState() => _DiscoverPageMainState();
}

class _DiscoverPageMainState extends State<DiscoverPageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DiscoverPageHeader(), Background()],
      ),
    );
  }
}
