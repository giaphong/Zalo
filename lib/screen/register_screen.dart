import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final String title;

  RegisterScreen({this.title});

  @override
  RegisterScreenState createState() {
    // TODO: implement createState
    return new RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
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
