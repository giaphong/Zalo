import 'package:flutter/material.dart';

class RegisterZalo extends StatefulWidget{
  final String title ;

  RegisterZalo({this.title});
  @override
  RegisterZaloState createState() {
    // TODO: implement createState
    return new RegisterZaloState();
  }
}

class RegisterZaloState extends State<RegisterZalo>{
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