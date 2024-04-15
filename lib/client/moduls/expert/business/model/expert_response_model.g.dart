// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertResponseModel _$ExpertResponseModelFromJson(Map<String, dynamic> json) =>
    ExpertResponseModel(
      experts: (json['results'] as List<dynamic>)
          .map((e) => ExpertModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpertResponseModelToJson(
        ExpertResponseModel instance) =>
    <String, dynamic>{
      'results': instance.experts,
    };

ExpertModel _$ExpertModelFromJson(Map<String, dynamic> json) => ExpertModel(
      address: json['address'] as String,
      allowAudioConsultation: json['allowAudioConsultation'] as bool?,
      allowVideoConsultation: json['allowVideoConsultation'] as bool?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      bio: json['bio'] as String?,
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>),
      consultationPrice: (json['consultationPrice'] as num).toDouble(),
      firstName: json['firstName'] as String,
      id: json['id'] as String,
      isFeatured: json['isFeatured'] as bool?,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profilePicture: json['profilePicture'] as String,
      specialty: SpecialtyReposneModel.fromJson(
          json['specialty'] as Map<String, dynamic>),
      yearsOfExperience: json['yearsOfExperience'] as int,
    );

Map<String, dynamic> _$ExpertModelToJson(ExpertModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'bio': instance.bio,
      'phoneNumber': instance.phoneNumber,
      'specialty': instance.specialty,
      'yearsOfExperience': instance.yearsOfExperience,
      'consultationPrice': instance.consultationPrice,
      'profilePicture': instance.profilePicture,
      'averageRating': instance.averageRating,
      'allowVideoConsultation': instance.allowVideoConsultation,
      'isFeatured': instance.isFeatured,
      'allowAudioConsultation': instance.allowAudioConsultation,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'id': instance.id,
    };
