import 'package:json_annotation/json_annotation.dart';

part 'ambulance_model.g.dart';

@JsonSerializable()
class AmbulanceModel {
  final String? id;
  final String? patientId;
  final String? hospitalId;
  final double? distance;
  final double? addressId;

  const AmbulanceModel({
    this.id,
    this.patientId,
    this.hospitalId,
    this.distance,
    this.addressId,
  });

  AmbulanceModel copyWith({
    String? id,
    String? patientId,
    String? hospitalId,
    double? distance,
    double? addressId,
  }) {
    return AmbulanceModel(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      hospitalId: hospitalId ?? this.hospitalId,
      distance: distance ?? this.distance,
      addressId: addressId ?? this.addressId,
    );
  }

  factory AmbulanceModel.fromJson(Map<String, dynamic> json) =>
      _$AmbulanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AmbulanceModelToJson(this);
}
