import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? email;
  final String? password;
  final String? emergencyId;

  const PatientModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.address,
    this.email,
    this.password,
    this.emergencyId,
  });

  PatientModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? address,
    String? email,
    String? password,
    String? emergencyId,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      email: email ?? this.email,
      password: password ?? this.password,
      emergencyId: emergencyId ?? this.emergencyId,
    );
  }

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
