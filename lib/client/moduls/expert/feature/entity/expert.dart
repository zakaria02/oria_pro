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
  final bool isFavourite;

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
    required this.isFavourite,
  });

  Expert copyWith({
    String? profilePicture,
    String? firstName,
    String? lastName,
    String? city,
    String? provinceId,
    String? provinceName,
    String? specialty,
    int? yearsOfExperience,
    double? consultationPrice,
    double? rateAvarage,
    String? bio,
    String? id,
    bool? available,
    bool? isFavourite,
  }) {
    return Expert(
      profilePicture: profilePicture ?? this.profilePicture,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      city: city ?? this.city,
      provinceId: provinceId ?? this.provinceId,
      provinceName: provinceName ?? this.provinceName,
      specialty: specialty ?? this.specialty,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      consultationPrice: consultationPrice ?? this.consultationPrice,
      rateAvarage: rateAvarage ?? this.rateAvarage,
      bio: bio ?? this.bio,
      id: id ?? this.id,
      available: available ?? this.available,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
