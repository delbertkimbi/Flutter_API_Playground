class User {
  final String gender;
  final String email;
  final String nat;
  final String phone;
  final String cell;

  final UserName name;

  User({
    required this.gender,
    required this.email,
    required this.nat,
    required this.phone,
    required this.cell,
    required this.name,
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
