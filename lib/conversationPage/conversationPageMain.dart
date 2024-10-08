import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/conversationPage/conversationMessageContainer.dart';
import 'package:messaging_app/createNewMessagePage/createNewMessageFooter.dart';
import 'package:messaging_app/globals/newMessageNotifer.dart';
import 'package:messaging_app/globals/socketConnection.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:provider/provider.dart';

class ConversationPageMain extends StatefulWidget {
  const ConversationPageMain({Key? key}) : super(key: key);

  @override
  _ConversationPageMainState createState() => _ConversationPageMainState();
}

class _ConversationPageMainState extends State<ConversationPageMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => StoredData().getNewMessageNotifer)
          ],
          child: Stack(
            children: [
              const Background(),
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 60),
                  child: const ConversationMessageContainer()),
              CreateNewMessageFooter(
                sendMessagePressed: (text) {
                  StoredData()
                      .getNewMessageNotifer
                      .saveOwnMessage("testing1", text);
                  StoredData().getNewMessageNotifer.sendMessage(text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
