import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_users/model/user.dart';
import 'package:random_users/model/user_name.dart';
import 'package:random_users/model/user_picture.dart';

class UserAPI {
  Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=30";

    final uri = Uri.parse(url);
    final responds = await http.get(uri);
    final json = jsonDecode(responds.body);
    final results = json["results"] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        tittle: e['name']['tittle'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final picture = UserPicture(
        large: e['picture']['large'],
        medium: e['picture']['medium'],
        thumbnail: e['picture']['thumbnail'],
      );
      return User(
        gender: e["gender"],
        email: e['email'],
        nat: e['nat'],
        phone: e['phone'],
        cell: e['cell'],
        name: name,
        picture: picture,
      );
    }).toList();
    return users;
  }
}
