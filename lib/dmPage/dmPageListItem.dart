import 'package:flutter/material.dart';
import 'package:messaging_app/conversationPage/conversationPageMain.dart';
import 'package:messaging_app/globals/storedData.dart';

class DmPageListItem extends StatelessWidget {
  final String userId;
  const DmPageListItem({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {
        StoredData().getNewMessageNotifer.setCurrentOpenId = userId,
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ConversationPageMain()))
      },
      child: Column(
        children: <Widget>[
          const Text(
            "Username",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Text(
            "Text messages",
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Container(
            height: 0.4,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
