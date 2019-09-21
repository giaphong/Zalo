import 'package:http/http.dart';
import 'dart:convert';

class Friend {
  final String email;

  final String name;

  final String profileImageUrl;
  final String gender;

  final String address;

  final double latitude;

  final double longitude;

  final String username;

  final int age;

  final String phone;

  final List<String> listImage;
  final String description;

  const Friend(
      {this.name,
      this.email,
      this.profileImageUrl,
      this.gender,
      this.address,
      this.latitude,
      this.phone,
      this.longitude,
      this.listImage,
      this.age,
      this.username,
      this.description});
}

Future<List<Friend>> fetchFriends(Client client) async {
  var url = 'https://randomuser.me/api/?results=100&nat=us';
  var response = await client.get(Uri.parse(url));
  List<Friend> list = new List();

  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    print(response.body);
    for (var res in mapResponse['results']) {
      var objName = res['name'];
      String name =
          objName['first'].toString() + " " + objName['last'].toString();
      var objImage = res['picture'];
      String profileUrl = objImage['large'].toString();
      String gender = res["gender"].toString();
      String address =
          res["location"]["street"].toString() + " " + res["location"]["city"].toString();
      double latitude =
          double.parse(res["location"]["coordinates"]["latitude"].toString());
      double longitude =
          double.parse(res["location"]["coordinates"]["longitude"].toString());
      String description = res["location"]["timezone"]["description"].toString();
      String username = res["login"]["username"].toString();
      int age = int.parse(res["dob"]["age"].toString());
      String phone = res["phone"].toString();
      Friend friend = new Friend(
          name: name,
          email: res['email'],
          profileImageUrl: profileUrl,
          gender: gender,
          address: address,
          latitude: latitude,
          longitude: longitude,
          description: description,
          username: username,
          age: age,
          phone: phone);
      list.add(friend);
    }
  } else {
    throw Exception('Failed to load friend');
  }
  return list;
}
