import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: HexColor("#F4F4FB"),
    );
  }
}
