// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracked_symptom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackedSymptomModel _$TrackedSymptomModelFromJson(Map<String, dynamic> json) =>
    TrackedSymptomModel(
      id: json['id'] as String,
      symptom: SymptomModel.fromJson(json['symptom'] as Map<String, dynamic>),
      isLogged: json['isLogged'] as bool,
      logEventId: json['logEventId'] as String?,
      logEventValue: json['logEventValue'] as int?,
      type: json['type'] as String,
      loggedActivites: (json['loggedActivites'] as List<dynamic>)
          .map((e) => ActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackedSymptomModelToJson(
        TrackedSymptomModel instance) =>
    <String, dynamic>{
      'symptom': instance.symptom,
      'type': instance.type,
      'logEventValue': instance.logEventValue,
      'isLogged': instance.isLogged,
      'logEventId': instance.logEventId,
      'id': instance.id,
      'loggedActivites': instance.loggedActivites,
    };

SymptomModel _$SymptomModelFromJson(Map<String, dynamic> json) => SymptomModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$SymptomModelToJson(SymptomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
