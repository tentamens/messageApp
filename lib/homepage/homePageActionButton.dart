import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:messaging_app/createNewMessagePage/createNewMessageMain.dart';

class HomePageActionButton extends StatefulWidget {
  const HomePageActionButton({super.key});

  @override
  _HomePageActionButtonState createState() => _HomePageActionButtonState();
}

class _HomePageActionButtonState extends State<HomePageActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1))
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutQuad));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const CreateNewMessageMain(),
                ));
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: HexColor("#8f7ffb"),
                borderRadius: BorderRadius.circular(60)),
            child: const Icon(
              Icons.add,
              size: 54,
              color: Colors.white,
            ),
          )),
    );
  }
}
