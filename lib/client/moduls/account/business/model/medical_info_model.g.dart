// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalInfoModel _$MedicalInfoModelFromJson(Map<String, dynamic> json) =>
    MedicalInfoModel(
      menstralHistory: json['MenstralHistory'] as String,
      familyHistory: json['familyHistory'] as String,
      familyHistoryIssues: json['familyHistoryIssues'] as String,
      undergoingHormonalTreatment:
          json['undergoingHormonalTreatment'] as String,
      contraindications: json['Contraindications'] as String,
      contraception: json['Contraception'] as String,
      physicalActivity: json['physicalActivity'] as String,
    );

Map<String, dynamic> _$MedicalInfoModelToJson(MedicalInfoModel instance) =>
    <String, dynamic>{
      'MenstralHistory': instance.menstralHistory,
      'familyHistory': instance.familyHistory,
      'familyHistoryIssues': instance.familyHistoryIssues,
      'undergoingHormonalTreatment': instance.undergoingHormonalTreatment,
      'Contraindications': instance.contraindications,
      'Contraception': instance.contraception,
      'physicalActivity': instance.physicalActivity,
    };
