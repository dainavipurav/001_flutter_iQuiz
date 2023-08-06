import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  String? id;
  String? name;
  String? icon;

  Data({this.id, this.name, this.icon});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
