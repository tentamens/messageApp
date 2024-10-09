import 'package:flutter/material.dart';

class DiscoverPageList extends StatefulWidget {
  const DiscoverPageList({Key? key}) : super(key: key);

  @override
  _DiscoverPageListState createState() => _DiscoverPageListState();
}

class _DiscoverPageListState extends State<DiscoverPageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          const Text(
            "Username",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Text(
            "Text messages",
            style: TextStyle(
                color: Colors.white.withOpacity(200),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          Container(
            height: 0.4,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
