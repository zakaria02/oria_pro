import 'package:json_annotation/json_annotation.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/city.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "provinceId")
  final String provinceId;
  @JsonKey(name: "provinceName")
  final String provinceName;
  @JsonKey(name: "id")
  final String id;

  const CityModel({
    required this.name,
    required this.provinceId,
    required this.provinceName,
    required this.id,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

extension CityModelMapper on CityModel {
  City toCity() {
    return City(
      name: name,
      provinceId: provinceId,
      provinceName: provinceName,
      id: id,
    );
  }
}
