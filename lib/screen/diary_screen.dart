import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  DiaryScreen({Key key}) : super(key: key);

  @override
  DiaryScreenState createState() {
    // TODO: implement createState
    return new DiaryScreenState();
  }
}

class DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: ListTile(
            contentPadding: const EdgeInsets.only(top: 0.0, left: 5.0),
            title: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tìm kiếm bạn bè và tin nhắn ..',
                  hintStyle: TextStyle(color: Colors.white)),
              onChanged: (text) {
                print(text);
              },
            ),
            leading: Icon(Icons.search),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
    );
  }
}
