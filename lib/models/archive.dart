import 'package:json_annotation/json_annotation.dart';

part 'archive.g.dart';

@JsonSerializable()
class Archive {
  final String id;
  final String name;  // 카페 이름
  final double lat;   // 위도
  final double lng;   // 경도

  Archive({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory Archive.fromJson(Object? json) =>
      _$ArchiveFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() =>
      _$ArchiveToJson(this);
}