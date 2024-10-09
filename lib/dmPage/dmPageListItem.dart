import 'package:flutter/material.dart';
import 'package:messaging_app/globals/storedData.dart';

class DmPageListItem extends StatelessWidget {
  final String userId;
  const DmPageListItem({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          {StoredData().getNewMessageNotifer.setCurrentOpenId = userId},
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
                color: Colors.white.withOpacity(200),
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
