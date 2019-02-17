import 'package:flutter/material.dart';
import 'package:search_view/screen/home/tabs_bottom/contact.dart';
import 'package:search_view/screen/home/tabs_bottom/diary.dart';
import 'package:search_view/screen/home/tabs_bottom/group.dart';
import 'package:search_view/screen/home/tabs_bottom/message.dart';
import 'package:search_view/screen/home/tabs_bottom/more.dart';
import 'package:search_view/screen/utils/bottom_nav/bottom_nav.dart';

class HomeZalo extends StatefulWidget{
  @override
  HomeZaloState createState() {
    return new HomeZaloState();
  }
}

class HomeZaloState extends State<HomeZalo> with SingleTickerProviderStateMixin{


  final Key keyMessage = PageStorageKey('pageMessage');
  final Key keyContact = PageStorageKey('pageContact');
  final Key keyGroup = PageStorageKey('pageGroup');
  final Key keyDialy = PageStorageKey('pageDialy');
  final Key keyMore = PageStorageKey('pageMore');
  final PageStorageBucket bucket = PageStorageBucket();
  int currentIndex = 0 ;
  List<Widget> _children ;
  Contact contact ;
  Message message;
  Group group ;
  Diary diary ;
  More more ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contact = Contact(key: keyContact,);
    message = Message(key: keyMessage,);
    group = Group(key: keyGroup,);
    diary = Diary(key: keyDialy,);
    more = More(key: keyMore,);

    _children = [message , contact , group , diary , more];
//    _children = [
//      Offstage(
//        offstage: currentIndex !=0,
//        child: message,
//      ),
//      Offstage(
//        offstage: currentIndex !=1,
//        child: contact,
//      ),
//      Offstage(
//        offstage: currentIndex !=2,
//        child: group,
//      ),
//      Offstage(
//        offstage: currentIndex !=3,
//        child: diary,
//      ),
//      Offstage(
//        offstage: currentIndex !=4,
//        child: more,
//      )];

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

//      bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
//        currentIndex: currentIndex,
//        onTap: (int index){
//          setState(() {
//            currentIndex = index ;
//          });
//        },
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.message,),
//            title: Text('Message'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.contacts,),
//            title: Text('Contacts'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.group,),
//            title: Text('Groups'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.refresh,),
//            title: Text('Dialy'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.more,),
//            title: Text('More'),
//          ),
//        ],
//      ),

    );
  }
}

