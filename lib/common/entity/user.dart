class User {
  final String name;
  final String? profilePicture;
  final DateTime? birthDay;
  final String email;
  final bool shareMedicalInfo;

  const User({
    required this.name,
    required this.profilePicture,
    required this.birthDay,
    required this.email,
    required this.shareMedicalInfo,
  });
}
