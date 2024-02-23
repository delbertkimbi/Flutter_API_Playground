import 'package:random_users/model/user_name.dart';
import 'package:random_users/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String nat;
  final String phone;
  final String cell;
  final UserName name;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.nat,
    required this.phone,
    required this.cell,
    required this.name,
    required this.picture,
  });
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      tittle: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      gender: e["gender"],
      email: e['email'],
      nat: e['nat'],
      phone: e['phone'],
      cell: e['cell'],
      name: name,
      picture: picture,
    );
  }
}
