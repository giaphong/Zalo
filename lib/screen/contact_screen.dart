import 'package:flutter/material.dart';
import 'package:search_view/screen/tab_contact_screen.dart';
import 'package:search_view/screen/tab_official_account_screen.dart';


class ContactScreen extends StatefulWidget {
  ContactScreen({Key key}) : super(key: key);

  @override
  ContactScreenState createState() {
    // TODO: implement createState
    return new ContactScreenState();
  }
}

class ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child:  Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: ListTile(
              title: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tìm kiếm bạn bè và tin nhắn ..',
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (text) {

                },
              ),
              leading: Icon(Icons.search),
              contentPadding: const EdgeInsets.only(top: 0.0, left: 5.0),

            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              isScrollable: false,
              tabs: <Widget>[
                Tab( text: 'Danh Bạ',),
                Tab( text: 'Tài khoản chính thức',),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              new TabContactScreen(),
              new TabOfficialAccountScreen()
            ],
          ),
        ),
    );
  }
}
