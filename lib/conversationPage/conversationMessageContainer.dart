import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messaging_app/globals/newMessageNotifer.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:provider/provider.dart';

class ConversationMessageContainer extends StatefulWidget {
  const ConversationMessageContainer({Key? key}) : super(key: key);

  @override
  _ConversationMessageContainerState createState() =>
      _ConversationMessageContainerState();
}

class _ConversationMessageContainerState
    extends State<ConversationMessageContainer> {
  List<String> message = [];

  @override
  final NewMessageNotifer messageNotifer = StoredData().getNewMessageNotifer;
  void initState() {
    super.initState();
    messageNotifer.addListener(reactToNotifer);
  }

  @override
  void dispose() {
    messageNotifer.removeListener(reactToNotifer);
    super.dispose();
  }

  void reactToNotifer() {
    print('hi to got ts');
    setState(() {
      message.add(NewMessageNotifer().getNewMessageData[1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: message.length,
      itemBuilder: (context, index) => Container(
        child: Text(
          message[index],
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  void addNewMessage(String a, String b, String text) {
    print("hello world");
    message.add(text);
  }
}
