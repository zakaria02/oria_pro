class Expert {
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String city;
  final String provinceId;
  final String provinceName;
  final String specialty;
  final int yearsOfExperience;
  final double consultationPrice;
  final double? rateAvarage;
  final String? bio;
  final String id;
  final bool available;

  String get fullName => "$firstName $lastName";

  const Expert({
    required this.profilePicture,
    required this.city,
    required this.firstName,
    required this.lastName,
    required this.provinceId,
    required this.provinceName,
    required this.specialty,
    required this.consultationPrice,
    required this.rateAvarage,
    required this.yearsOfExperience,
    required this.bio,
    required this.id,
    required this.available,
  });
}
