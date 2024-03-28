class Expert {
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String city;
  final String province;
  final String specialty;
  final int yearsOfExperience;
  final double consultationPrice;
  final double? rateAvarage;
  final String? bio;

  const Expert({
    required this.profilePicture,
    required this.city,
    required this.firstName,
    required this.lastName,
    required this.province,
    required this.specialty,
    required this.consultationPrice,
    required this.rateAvarage,
    required this.yearsOfExperience,
    required this.bio,
  });
}
