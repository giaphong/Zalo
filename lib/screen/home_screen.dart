import 'package:flutter/material.dart';
import 'package:search_view/utils/bottom_nav/bottom_nav.dart';

import 'contact_screen.dart';
import 'diary_screen.dart';
import 'group_screen.dart';
import 'message_screen.dart';
import 'more_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  final Key keyMessage = PageStorageKey('pageMessage');
  final Key keyContact = PageStorageKey('pageContact');
  final Key keyGroup = PageStorageKey('pageGroup');
  final Key keyDialy = PageStorageKey('pageDialy');
  final Key keyMore = PageStorageKey('pageMore');
  final PageStorageBucket bucket = PageStorageBucket();
  int currentIndex = 0 ;
  List<Widget> _children ;
  ContactScreen contact ;
  MessageScreen message;
  GroupScreen group ;
  DiaryScreen diary ;
  MoreScreen more ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contact = ContactScreen(key: keyContact,);
    message = MessageScreen(key: keyMessage,);
    group = GroupScreen(key: keyGroup,);
    diary = DiaryScreen(key: keyDialy,);
    more = MoreScreen(key: keyMore,);

    _children = [message , contact , group , diary , more];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _children[currentIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavBar(
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        activeColor: Colors.orange,
        inactiveColor: Colors.blue,
        items: [
          BottomNavBarItem(icon: Icon(Icons.message,), title: Text('Message')),
          BottomNavBarItem(icon: Icon(Icons.contacts , ), title: Text('Contacts')),
          BottomNavBarItem(icon: Icon(Icons.group , ), title: Text('Group')),
          BottomNavBarItem(icon: Icon(Icons.refresh , ), title: Text('Dialy')),
          BottomNavBarItem(icon: Icon(Icons.more , ), title: Text('More')),
        ],
      ),
    );
  }
}

