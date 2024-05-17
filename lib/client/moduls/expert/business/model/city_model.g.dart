// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'] as String,
      provinceId: json['provinceId'] as String,
      provinceName: json['provinceName'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'id': instance.id,
    };
