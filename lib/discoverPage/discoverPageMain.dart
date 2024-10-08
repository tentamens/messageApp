import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/discoverPage/discoverPageFooter.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';
import 'package:messaging_app/globals/crypto.dart';
import 'package:messaging_app/globals/storedData.dart';

class DiscoverPageMain extends StatefulWidget {
  const DiscoverPageMain({Key? key}) : super(key: key);

  @override
  _DiscoverPageMainState createState() => _DiscoverPageMainState();
}

class _DiscoverPageMainState extends State<DiscoverPageMain> {
  @override
  void initState() {
    super.initState();
    print("hi");
    StoredData().load();
    Crypto().init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Background(),
          DiscoverPageHeader(),
          Align(
            child: DiscoverPageFooter(),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
