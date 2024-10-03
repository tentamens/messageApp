import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateNewMessageFooter extends StatefulWidget {
  const CreateNewMessageFooter({Key? key}) : super(key: key);

  @override
  _CreateNewMessageFooterState createState() => _CreateNewMessageFooterState();
}

class _CreateNewMessageFooterState extends State<CreateNewMessageFooter> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        width: double.infinity,
        color: HexColor("0e2439"),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Icon(
                Icons.question_mark,
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  border: InputBorder.none),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              child: Icon(
                Icons.send_rounded,
                color: HexColor("00ADB5"),
                size: 30,
              ),
            ),
            const SizedBox(width: 12)
          ],
        ),
      ),
    );
  }
}
