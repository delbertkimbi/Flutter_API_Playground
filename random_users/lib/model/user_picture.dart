class UserPicture {
  final String medium;

  UserPicture({
    required this.medium,
  });
  factory UserPicture.fromMap(Map<String, dynamic> json) {
    return UserPicture(
      medium: json['medium'],
    );
  }
}
