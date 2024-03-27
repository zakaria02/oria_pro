import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/constants/oria_links.dart';
import '../../feature/entity/symptom_info.dart';

part 'symptom_info_model.g.dart';

@JsonSerializable()
class SymptomInfoModel {
  final String id;
  final String icon;
  final String name;

  const SymptomInfoModel(
      {required this.id, required this.icon, required this.name});

  factory SymptomInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomInfoModelToJson(this);
}

extension SymptomInfoModelMappers on SymptomInfoModel {
  SymptomInfo toSymptomInfo() {
    return SymptomInfo(
      symptomId: id,
      icon: "${OriaLinks.stagingSymptomsAssetsBaseUrl}/$icon",
      name: name,
    );
  }
}
