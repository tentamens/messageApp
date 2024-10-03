import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverPageHeader extends StatelessWidget {
  const DiscoverPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 60, 12, 15),
      color: HexColor("1B1A55").withOpacity(0.7),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.arrow_back, size: 30, color: Colors.white),
          Text(
            "Loading...",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Icon(Icons.notifications, size: 30, color: Colors.white)
        ],
      ),
    );
  }
}
