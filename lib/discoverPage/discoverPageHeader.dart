import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverPageHeader extends StatelessWidget {
  const DiscoverPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 60, 12, 15),
      color: HexColor("122B42").withOpacity(0.7),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.arrow_back, size: 27, color: Colors.white),
          Text(
            "Loading...",
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.w600),
          ),
          Icon(Icons.notifications, size: 27, color: Colors.white)
        ],
      ),
    );
  }
}
