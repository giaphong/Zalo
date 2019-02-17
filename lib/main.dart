import 'package:flutter/material.dart';
import 'package:search_view/screen/home.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zalo',
      home: MyHomeZaLo(),
    );
  }
}

void main() {
  runApp(MyHome());
}
