import 'package:flutter/material.dart';

class DiscoverPageHeader extends StatelessWidget {
  const DiscoverPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.arrow_back, size: 20, color: Colors.grey.withOpacity(0.6)),
        const Text(
          "Loading...",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Icon(Icons.notifications, size: 20, color: Colors.grey.withOpacity(0.6))
      ],
    );
  }
}
