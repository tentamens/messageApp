import 'package:flutter/material.dart';
import 'package:messaging_app/globals/storedData.dart';

class DmPageList extends StatelessWidget {
  const DmPageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: StoredData().getMessage,
      itemBuilder: (context, index) => Column(
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
