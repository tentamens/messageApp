import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
      color: HexColor("1B1A55").withOpacity(0.7),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu, size: 27, color: Colors.white),
          Icon(Icons.search, size: 27, color: Colors.white)
        ],
      ),
    );
  }
}
