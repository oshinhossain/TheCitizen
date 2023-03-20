import 'package:json_annotation/json_annotation.dart';
part 'location_traces.g.dart';

@JsonSerializable()
class LocationTraces {
  String? id;
  String? username;
  double? latitude;
  double? longitude;
  String? geographyPointJson;
  String? afterVisitTime;

  LocationTraces({this.id, this.username, this.latitude, this.longitude, this.geographyPointJson, this.afterVisitTime});

  factory LocationTraces.fromJson(Map<String, dynamic> json) => _$LocationTracesFromJson(json);
  Map<String, dynamic> toJson() => _$LocationTracesToJson(this);
}
