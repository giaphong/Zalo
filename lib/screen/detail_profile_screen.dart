import 'package:flutter/material.dart';

class DetailProfileScreen extends StatefulWidget {
  final String title;

  DetailProfileScreen({this.title});

  @override
  DetailProfileScreenState createState() {
    // TODO: implement createState
    return new DetailProfileScreenState();
  }
}

class DetailProfileScreenState extends State<DetailProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
