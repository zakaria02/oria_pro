import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/account/feature/entity/medical_info.dart';

part 'medical_info_model.g.dart';

@JsonSerializable()
class MedicalInfoModel {
  @JsonKey(name: "MenstralHistory")
  final String menstralHistory;
  @JsonKey(name: "familyHistory")
  final String familyHistory;
  @JsonKey(name: "familyHistoryIssues")
  final String familyHistoryIssues;
  @JsonKey(name: "undergoingHormonalTreatment")
  final String undergoingHormonalTreatment;
  @JsonKey(name: "Contraindications")
  final String contraindications;
  @JsonKey(name: "Contraception")
  final String contraception;
  @JsonKey(name: "physicalActivity")
  final String physicalActivity;

  const MedicalInfoModel({
    required this.menstralHistory,
    required this.familyHistory,
    required this.familyHistoryIssues,
    required this.undergoingHormonalTreatment,
    required this.contraindications,
    required this.contraception,
    required this.physicalActivity,
  });

  factory MedicalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MedicalInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalInfoModelToJson(this);
}

extension MedicalInfoModelMappers on MedicalInfoModel {
  MedicalInfo toMedicalInfo() {
    return MedicalInfo(
      menstralHistory: menstralHistory,
      familyHistory: familyHistory,
      familyHistoryIssues: familyHistoryIssues,
      undergoingHormonalTreatment: undergoingHormonalTreatment,
      contraindications: contraindications,
      contraception: contraception,
      physicalActivity: physicalActivity,
    );
  }
}

extension MedicalInfoMappers on MedicalInfo {
  MedicalInfoModel toMedicalInfoModel() {
    return MedicalInfoModel(
      menstralHistory: menstralHistory,
      familyHistory: familyHistory,
      familyHistoryIssues: familyHistoryIssues,
      undergoingHormonalTreatment: undergoingHormonalTreatment,
      contraindications: contraindications,
      contraception: contraception,
      physicalActivity: physicalActivity,
    );
  }
}
