import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String? id;
  final double? longitude;
  final double? latitude;

  const AddressModel({
    this.id,
    this.longitude,
    this.latitude,
  });

  AddressModel copyWith({
    String? id,
    double? longitude,
    double? latitude,
  }) {
    return AddressModel(
      id: id ?? this.id,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
