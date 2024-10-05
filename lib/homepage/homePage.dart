import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/globals/crypto.dart';
import 'package:messaging_app/globals/fireBaseMessaging.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:messaging_app/homepage/homePageActionButton.dart';
import 'package:messaging_app/homepage/homePageHeader.dart';
import 'package:messaging_app/homepage/homePageMessages.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    await Firebase.initializeApp(
      demoProjectId: "demo-project-id",
    );
    Crypto().init();
    StoredData().load();
    FireBaseMessaging().initClient();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [Background(), HomePageHeader()],
        ),
        floatingActionButton: HomePageActionButton(),
      ),
    );
  }
}
