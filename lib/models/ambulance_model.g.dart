// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ambulance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmbulanceModel _$AmbulanceModelFromJson(Map<String, dynamic> json) =>
    AmbulanceModel(
      id: json['id'] as String?,
      patientId: json['patientId'] as String?,
      hospitalId: json['hospitalId'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      addressId: (json['addressId'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AmbulanceModelToJson(AmbulanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'hospitalId': instance.hospitalId,
      'distance': instance.distance,
      'addressId': instance.addressId,
    };
