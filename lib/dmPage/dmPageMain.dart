import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';
import 'package:messaging_app/dmPage/dmPageList.dart';
import 'package:messaging_app/dmPage/dmPageSideMenu.dart';
import 'package:messaging_app/globals/messageFileHandler.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:messaging_app/homepage/homePageHeader.dart';

class DmPageMain extends StatefulWidget {
  const DmPageMain({super.key});

  @override
  _DmPageMainState createState() => _DmPageMainState();
}

class _DmPageMainState extends State<DmPageMain> {
  @override
  void initState() {
    super.initState();
    StoredData().load();
    MessageFileHandler().loadFile();
    print(StoredData().getMessage.length);
    print(StoredData().getMessage);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            HomePageHeader(),
            DmPageList(),
          ],
        ),
      ),
    );
  }
}
