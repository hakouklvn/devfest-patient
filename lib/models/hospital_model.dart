import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()
class HospitalModel {
  final String? id;
  final String? name;
  final String? address;
  final String? phoneNumber;
  final int? availableBeds;
  final int? doctors;
  final int? expectedPatients;

  const HospitalModel({
    this.id,
    this.expectedPatients,
    this.name,
    this.address,
    this.phoneNumber,
    this.availableBeds,
    this.doctors,
  });

  HospitalModel copyWith({
    String? id,
    String? name,
    String? address,
    String? phoneNumber,
    int? expectedPatients,
    int? availableBeds,
    int? doctors,
  }) {
    return HospitalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      expectedPatients: expectedPatients ?? this.expectedPatients,
      availableBeds: availableBeds ?? this.availableBeds,
      doctors: doctors ?? this.doctors,
    );
  }

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalModelToJson(this);
}
