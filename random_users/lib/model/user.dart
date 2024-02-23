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
}

/// Mapping complex objects
class UserName {
  final String tittle;
  final String first;
  final String last;

  UserName({
    required this.tittle,
    required this.first,
    required this.last,
  });
}

class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
}
