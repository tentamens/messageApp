import 'package:flutter/material.dart';
import 'package:messaging_app/conversationPage/conversationMessageContainer.dart';
import 'package:messaging_app/conversationPage/conversationPageMain.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';
import 'package:messaging_app/discoverPage/discoverPageMain.dart';
import 'package:messaging_app/dmPage/dmPageMain.dart';
import 'package:messaging_app/dmPage/editProfilePage/editProfilePageMain.dart';
import 'package:messaging_app/globals/crypto.dart';
import 'package:messaging_app/globals/messageFileHandler.dart';
import 'package:messaging_app/globals/newMessageNotifer.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:messaging_app/homepage/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  final NewMessageNotifer newMess = NewMessageNotifer();
  newMess.connectToSever();
  newMess.registerClient();
  StoredData().setNewMessageNotifer = newMess;
  runApp(
    const EditProfilePageMain(),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    print("hello world");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DiscoverPageMain(),
      ),
    );
  }
}
