import 'package:flutter/material.dart';
import 'package:messaging_app/dmPage/dmPageMain.dart';

class ConversationPageBack extends StatelessWidget {
  const ConversationPageBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
        child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DmPageMain(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 35,
            )),
      ),
    );
  }
}
