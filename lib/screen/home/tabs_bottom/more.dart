import 'package:flutter/material.dart';
import 'package:search_view/screen/fragment/first.dart';
import 'package:search_view/screen/fragment/two.dart';
import 'package:search_view/screen/fragment/three.dart';


class DrawerItem {
  String title ;
  IconData icon ;
  DrawerItem(this.title , this.icon);
}

class More extends StatefulWidget{
  final drawerItems = [
    new DrawerItem("First", Icons.rss_feed),
    new DrawerItem("Two", Icons.local_pizza),
    new DrawerItem("Three", Icons.info)
  ];

  More({Key key}): super(key : key);

  @override
  MoreState createState() {
    // TODO: implement createState
    return new MoreState();
  }
}

class MoreState extends State<More>{

  int _selectedDrawerIndex = 0 ;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0 : {
        return new FirstFragment();
      }
      case 1:{
        return new TwoFragment();
      }
      case 2 : {
        return new ThreeFragment();
      }
    }
  }

  _onSelectedItem(int index){
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.pop(context);
//    Navigator.of(context).push(MaterialPageRoute(
//        builder: (BuildContext context) => NewPage("Page two")));

  }


  @override
  Widget build(BuildContext context) {

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectedItem(i),
          )
      );
    }


    // TODO: implement build
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          titleSpacing: 0.0,
          title: ListTile(
            contentPadding: const EdgeInsets.only(top: 0.0, left: 5.0),
            title: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tìm kiếm bạn bè và tin nhắn ..',
                  hintStyle: TextStyle(color: Colors.white)
              ),
              onChanged: (text){
                print(text);
              },
            ),
            leading: Icon(Icons.search),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.pages),
              onPressed: (){

              },
            ),

            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){

              },
            )
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            child: Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                    accountName: new Text("John Doe"), accountEmail: Text('phongng155@gmail.com')),
                new Column(children: drawerOptions)
              ],
            ),
          ),

        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}