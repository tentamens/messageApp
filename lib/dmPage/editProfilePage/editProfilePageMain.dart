import 'package:avatar_maker/avatar_maker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:messaging_app/background.dart';

class EditProfilePageMain extends StatefulWidget {
  const EditProfilePageMain({Key? key}) : super(key: key);

  @override
  _EditProfilePageMainState createState() => _EditProfilePageMainState();
}

class _EditProfilePageMainState extends State<EditProfilePageMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            Center(child: AvatarMakerAvatar()),
            Align(
                alignment: Alignment.bottomCenter,
                child: AvatarMakerCustomizer(
                  theme: AvatarMakerThemeData(
                      tilePadding: EdgeInsets.all(2),
                      nbrTilesRow: 4,
                      selectedIconColor: Colors.white,
                      unselectedIconColor: Colors.grey.shade500,
                      labelTextStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      primaryBgColor: HexColor("#17283a"),
                      secondaryBgColor: HexColor("1A2C42")),
                ))
          ],
        ),
      ),
    );
  }
}
