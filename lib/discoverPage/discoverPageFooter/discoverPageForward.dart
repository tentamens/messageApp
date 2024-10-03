import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiscoverPageForward extends StatelessWidget {
  const DiscoverPageForward({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: TextButton(
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: HexColor("1B1A55"),
                borderRadius: BorderRadius.circular(16)),
            child: const Icon(
              Icons.arrow_forward,
              size: 40,
              color: Colors.white,
            ),
          )),
    );
  }
}
