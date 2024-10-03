import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class CreateNewMessageContainer extends StatefulWidget {
  const CreateNewMessageContainer({Key? key}) : super(key: key);

  @override
  _CreateNewMessageContainerState createState() =>
      _CreateNewMessageContainerState();
}

class _CreateNewMessageContainerState extends State<CreateNewMessageContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Whats on your mind?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: GifView.asset(
                "assets/face-emoji.gif",
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ],
    );
  }
}
