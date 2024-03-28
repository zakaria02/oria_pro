import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/expert.dart';
import 'package:oria_pro/utils/constants/oria_links.dart';
import 'specialty_response_model.dart';

part 'expert_response_model.g.dart';

@JsonSerializable()
class ExpertResponseModel {
  @JsonKey(name: "results")
  final List<ExpertModel> experts;

  const ExpertResponseModel({required this.experts});

  factory ExpertResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertResponseModelToJson(this);
}

@JsonSerializable()
class ExpertModel {
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "city")
  final CityModel city;
  @JsonKey(name: "bio")
  final String? bio;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "specialty")
  final SpecialtyReposneModel specialty;
  @JsonKey(name: "yearsOfExperience")
  final int yearsOfExperience;
  @JsonKey(name: "consultationPrice")
  final double consultationPrice;
  @JsonKey(name: "profilePicture")
  final String profilePicture;
  @JsonKey(name: "averageRating")
  final double? averageRating;
  @JsonKey(name: "allowVideoConsultation")
  final bool? allowVideoConsultation;
  @JsonKey(name: "isFeatured")
  final bool? isFeatured;
  @JsonKey(name: "allowAudioConsultation")
  final bool? allowAudioConsultation;
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "id")
  final String id;

  const ExpertModel({
    required this.address,
    required this.allowAudioConsultation,
    required this.allowVideoConsultation,
    required this.averageRating,
    required this.bio,
    required this.city,
    required this.consultationPrice,
    required this.firstName,
    required this.id,
    required this.isFeatured,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.specialty,
    required this.yearsOfExperience,
  });

  factory ExpertModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertModelToJson(this);
}

@JsonSerializable()
class CityModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "province")
  final String province;
  @JsonKey(name: "id")
  final String id;

  const CityModel({
    required this.name,
    required this.province,
    required this.id,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

extension ExpertModelMappers on ExpertModel {
  Expert toExpert() {
    return Expert(
      profilePicture:
          "${OriaLinks.stagingExpertsAssetsBaseUrl}/$profilePicture",
      city: city.name,
      firstName: firstName,
      lastName: lastName,
      province: city.province,
      specialty: specialty.name,
      rateAvarage: averageRating,
      yearsOfExperience: yearsOfExperience,
      consultationPrice: consultationPrice,
      bio: bio,
    );
  }
}
