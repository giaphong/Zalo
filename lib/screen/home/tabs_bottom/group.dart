import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Group extends StatefulWidget {
  Group({Key key}) : super(key: key);

  @override
  GroupState createState() {
    // TODO: implement createState
    return new GroupState();
  }
}

class GroupState extends State<Group> {

  PopupMenuGroup _selectedChoices = choices[0];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('No: ' + payload);
    }
//    await Navigator.push(
//      context,
//      new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
//    );
  }

  int id = 0 ;
  Future  displayANotification() async{
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        id, 'Zalo Khuyến Mại', '1000 sản phẩm giá không đồng .', platformChannelSpecifics,
        payload: 'Tham gia đi nào');
    setState(() {
      id ++ ;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: ListTile(
            dense: false,
            contentPadding: const EdgeInsets.only(top: 0.0, left: 5.0, right: 0.0),
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
              icon: Icon(Icons.add),
              onPressed: () {},
            ),

            PopupMenuButton<PopupMenuGroup>(
              icon: Icon(Icons.group),
              elevation: 3.2,
              initialValue: choices[0],
              onCanceled: () {
                print('You have not chossed anything');
              },
              onSelected: (choice){
                setState(() {
                  _selectedChoices = choice;
                });
              },
              tooltip: 'This is tooltip',
              itemBuilder: (BuildContext context) {
                return choices.map((PopupMenuGroup choice) {
                  return PopupMenuItem<PopupMenuGroup>(
                    value: choice,
                    child: ListTile(leading: Icon(choice.icon), title: Text(choice.title),),
                  );
                }).toList();
              },
            )

          ],
        ),
        body: Container(
          child: Center(
            child: MaterialButton(
              child: Text('Show Notification'),
              onPressed: (){
                displayANotification();
              },
            ),

          ),
      ),
    );
  }
}

List<PopupMenuGroup> choices = <PopupMenuGroup>[
  PopupMenuGroup(title: 'Home', icon: Icons.home),
  PopupMenuGroup(title: 'Bookmarks', icon: Icons.bookmark),
  PopupMenuGroup(title: 'Settings', icon: Icons.settings),

];

class PopupMenuGroup {
  PopupMenuGroup({this.title , this.icon});
  final String title ;
  final IconData icon ;
}
