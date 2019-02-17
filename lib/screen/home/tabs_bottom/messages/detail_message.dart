import 'package:flutter/material.dart';

class DetailMessage extends StatefulWidget{
  
  final String title ;
  DetailMessage({this.title});
  
  @override
  DetailMessgaeState createState() {
    // TODO: implement createState
    return new DetailMessgaeState();
  }
}

class DetailMessgaeState extends State<DetailMessage>{
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