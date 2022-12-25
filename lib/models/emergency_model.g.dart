// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyModel _$EmergencyModelFromJson(Map<String, dynamic> json) =>
    EmergencyModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      time: json['time'] as String?,
      priorety: json['priorety'] as String?,
    );

Map<String, dynamic> _$EmergencyModelToJson(EmergencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'description': instance.description,
      'time': instance.time,
      'priorety': instance.priorety,
    };
