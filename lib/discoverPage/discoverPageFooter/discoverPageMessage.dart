import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverPageMessage extends StatelessWidget {
  const DiscoverPageMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
          decoration: BoxDecoration(
              color: HexColor("1B1A55"),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: <Widget>[
              const Icon(Icons.message_rounded, color: Colors.white, size: 36),
              Text(
                "  Message",
                style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )
            ],
          )),
    );
  }
}
