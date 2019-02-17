import 'package:http/http.dart';
import 'dart:convert';

class Friend {
  final String email ;
  final String name ;
  final String profileImageUrl ;

  const Friend({this.name , this.email , this.profileImageUrl});
}

Future<List<Friend>> fetchFriends(Client client) async{
  var url = 'https://randomuser.me/api/?results=100&nat=us';
  var response = await client.get(Uri.parse(url));
  List<Friend> list = new List();

  if(response.statusCode == 200){
    Map<String , dynamic> mapResponse = json.decode(response.body);
    for(var res in mapResponse['results']){
      var objName = res['name'];
      String name = objName['first'].toString() + " " + objName['last'].toString();
      var objImage = res['picture'];
      String profileUrl = objImage['large'].toString();
      Friend friend = new Friend(name: name , email: res['email'], profileImageUrl: profileUrl);
      list.add(friend);
    }
  }else {
    throw Exception('Failed to load friend');
  }
  return list;
}


