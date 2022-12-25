import 'package:json_annotation/json_annotation.dart';

part 'emergency_model.g.dart';

@JsonSerializable()
class EmergencyModel {
  final String? id;
  final String? type;
  final String? description;
  final String? time;
  final String? priorety;

  const EmergencyModel({
    this.id,
    this.type,
    this.description,
    this.time,
    this.priorety,
  });

  EmergencyModel copyWith({
    String? id,
    String? type,
    String? description,
    String? time,
    String? priorety,
  }) {
    return EmergencyModel(
      id: id ?? this.id,
      type: type ?? this.type,
      description: description ?? this.description,
      time: time ?? this.time,
      priorety: priorety ?? this.priorety,
    );
  }

  factory EmergencyModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyModelToJson(this);
}
