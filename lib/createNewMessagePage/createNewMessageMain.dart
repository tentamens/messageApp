import 'package:flutter/material.dart';
import 'package:messaging_app/background.dart';
import 'package:messaging_app/createNewMessagePage/createNewMessageContainer.dart';
import 'package:messaging_app/createNewMessagePage/createNewMessageFooter.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';

class CreateNewMessageMain extends StatefulWidget {
  const CreateNewMessageMain({super.key});

  @override
  _CreateNewMessageMainState createState() => _CreateNewMessageMainState();
}

class _CreateNewMessageMainState extends State<CreateNewMessageMain> {
  @override
  void initState() {
    super.initState();
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            DiscoverPageHeader(),
            CreateNewMessageContainer(),
            CreateNewMessageFooter(
              sendMessagePressed: (t) => {},
            )
          ],
        ),
      ),
    );
  }
}
