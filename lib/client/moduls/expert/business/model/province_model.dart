import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/province.dart';

part 'province_model.g.dart';

@JsonSerializable()
class ProvinceModel {
  @JsonKey(name: "id")
  final String provinceId;
  @JsonKey(name: "name")
  final String provinceName;

  const ProvinceModel({
    required this.provinceId,
    required this.provinceName,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}

extension CityModelMapper on ProvinceModel {
  Province toProvince() {
    return Province(
      id: provinceId,
      name: provinceName,
    );
  }
}
