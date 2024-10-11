import 'package:flutter/material.dart';

class DmPageSideMenu extends StatefulWidget {
  const DmPageSideMenu({Key? key}) : super(key: key);

  @override
  _DmPageSideMenuState createState() => _DmPageSideMenuState();
}

class _DmPageSideMenuState extends State<DmPageSideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: double.infinity,
      color: Colors.white,
    );
  }
}
