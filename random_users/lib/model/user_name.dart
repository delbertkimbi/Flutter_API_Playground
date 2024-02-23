/// Mapping complex objects
class UserName {
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });
  factory UserName.fromMap(Map<String, dynamic> json) {
    return UserName(
      title: json['title'] ?? 'Default Title',
      first: json['first'] ?? 'Default First',
      last: json['last'] ?? 'Default Last',
    );
  }
}
