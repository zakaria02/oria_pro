class User {
  final String name;
  final String? profilePicture;
  final DateTime? birthDay;
  final String email;

  const User({
    required this.name,
    required this.profilePicture,
    required this.birthDay,
    required this.email,
  });
}
