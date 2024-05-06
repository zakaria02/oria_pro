import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/common/symptoms/feature/entity/symptom_info.dart';

import '../../../../utils/constants/oria_links.dart';
import '../../feature/entity/symptom.dart';
import 'symptom_info_model.dart';

part 'user_symptom_model.g.dart';

@JsonSerializable()
class UserSymptomModel {
  final String id;
  final SymptomInfoModel symptom;
  final String type;

  const UserSymptomModel({
    required this.id,
    required this.symptom,
    required this.type,
  });

  factory UserSymptomModel.fromJson(Map<String, dynamic> json) =>
      _$UserSymptomModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserSymptomModelToJson(this);
}

extension UserSymptomMappers on UserSymptomModel {
  Symptom toSymptom() {
    return Symptom(
      userSymptomId: id,
      symptomId: symptom.id,
      icon: "${OriaLinks.stagingSymptomsAssetsBaseUrl}/${symptom.icon}",
      name: symptom.name,
      type: switch (type) {
        "primary" => SymptomType.primary,
        _ => SymptomType.secondary,
      },
    );
  }

  SymptomInfo toSymptomInfo() {
    return SymptomInfo(
        symptomId: symptom.id, icon: symptom.icon, name: symptom.name);
  }
}
