import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_users/model/user.dart';
import 'package:random_users/model/user_name.dart';
import 'package:random_users/model/user_picture.dart';

class UserAPI {
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=30";

    final uri = Uri.parse(url);
    final responds = await http.get(uri);
    final json = jsonDecode(responds.body);
    final results = json["results"] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
