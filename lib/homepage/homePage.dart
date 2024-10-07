import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/globals/crypto.dart';
import 'package:messaging_app/globals/socketConnection.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:messaging_app/homepage/homePageActionButton.dart';
import 'package:messaging_app/homepage/homePageHeader.dart';
import 'package:messaging_app/homepage/homePageMessages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Crypto().init();
    StoredData().load();
    SocketConnection().connectToSever();
    //SocketConnection().registerClient();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [Background(), HomePageHeader()],
        ),
        floatingActionButton: HomePageActionButton(),
      ),
    );
  }
}
