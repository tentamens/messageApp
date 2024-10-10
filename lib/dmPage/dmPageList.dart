import 'package:flutter/material.dart';
import 'package:messaging_app/dmPage/dmPageListItem.dart';
import 'package:messaging_app/globals/storedData.dart';

class DmPageList extends StatelessWidget {
  const DmPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: ListView.builder(
          itemCount: StoredData().getMessage.length,
          itemBuilder: (context, index) =>
              DmPageListItem(userId: messages[index]["userId"])),
    );
  }
}
