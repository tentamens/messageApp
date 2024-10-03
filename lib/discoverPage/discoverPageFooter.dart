import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:messaging_app/discoverPage/discoverPageFooter/discoverPageBack.dart';
import 'package:messaging_app/discoverPage/discoverPageFooter/discoverPageForward.dart';
import 'package:messaging_app/discoverPage/discoverPageFooter/discoverPageMessage.dart';
import 'package:messaging_app/discoverPage/discoverPageHeader.dart';

class DiscoverPageFooter extends StatelessWidget {
  const DiscoverPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DiscoverPageBack(),
          DiscoverPageMessage(),
          DiscoverPageForward()
        ],
      ),
    );
  }
}
