import 'package:flutter/material.dart';
import 'package:search_view/screen/home/model/friend.dart';
import 'package:http/http.dart';
import 'package:search_view/screen/home/tabs_bottom/messages/detail_message.dart';
import 'package:search_view/screen/utils/loader/loader.dart';
import 'package:search_view/screen/utils/loader/loader_image.dart';

class Message extends StatefulWidget {
  Message({Key key}) : super(key: key);

  @override
  MessageState createState() {
    return new MessageState();
  }
}

class MessageState extends State<Message> {

  bool isSearch = false;
  String textSearch = '';
  List<Friend> listFriend = new List();

  Widget _buidRow(Friend friend){
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 20.0,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(friend.profileImageUrl),
      ),
      title: Text(friend.name,),
      subtitle: Text(friend.email),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMessage(title: friend.name,),
          ),
        );
      },
    );
  }


  Widget listviewFriend(BuildContext context , List<Friend> listFriend){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listFriend.length,
      itemBuilder: (context , index){
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: _buidRow(listFriend.elementAt(index)),
          ),
        );
      },
    );
  }

  List<Friend> listSearch(String textSearch){
    List<Friend> list = new List();
    for(int i =0 ; i< listFriend.length ; i++){
      if(listFriend.elementAt(i).name.toLowerCase().contains(textSearch.toLowerCase())){
        list.add(listFriend.elementAt(i));
      }
    }
    return list ;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                setState(() {
                  if(text.trim().isEmpty){
                    isSearch = false;
                    textSearch = text;
                  }else {
                    isSearch = true;
                    textSearch = text;
                  }
                });
              },
            ),
            leading: Icon(Icons.search),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: (){

              },
            ),

            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){

              },
            )
          ],
        ),

        body: Container(
          child:FutureBuilder(
            future: fetchFriends(Client()),
            builder: (context , snapshot){
              if(snapshot.hasError)
                print(snapshot.hasError);
              if(snapshot.hasData){
                listFriend = snapshot.data;
                return  (isSearch == true ? listviewFriend(context, listSearch(textSearch)): listviewFriend(context, listFriend));
              }else {
                return Center(
                  child: ColorLoader2(),
                );
              }
//              return snapshot.hasData ? listviewFriend(context,  snapshot.data): Center(child: CircularProgressIndicator(),);

            },
          )
      ),
    );
  }

}
