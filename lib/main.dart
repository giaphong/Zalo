import 'package:flutter/material.dart';
import 'package:search_view/screen/home_splash_screen.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zalo',
      home: HomeSplashScreen(),
    );
  }
}

void main() {
  runApp(MyHome());
}
