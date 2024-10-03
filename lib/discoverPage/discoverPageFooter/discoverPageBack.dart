import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverPageBack extends StatelessWidget {
  const DiscoverPageBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: TextButton(
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: HexColor("1B1A55"),
                borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
          )),
    );
  }
}
