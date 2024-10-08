import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
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
  List<List> message = [];

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
    print("hello world I called");
    setState(() {
      message.add(List.from(NewMessageNotifer().getNewMessageData));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: message.length,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment:
            message[index][2] ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: HexColor("1B1A55"),
                borderRadius: BorderRadius.circular(18)),
            child: Text(
              message[index][1],
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void addNewMessage(String a, String b, String text, bool from) {
    message.add([text, from]);
  }
}
