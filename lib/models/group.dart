import 'package:archive/common/config.dart';
import 'package:archive/models/artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group{

  final String name;  // 그룹명
  final DateTime createdAt;  // 생성 일자
  final DateTime updatedAt;  // 마지막 업데이트 일자
  final DateTime debutDate;  // 데뷔일
  final dynamic logo; // 그룹 로고 이미지
  final List<Artist>? artists; // 아티스트 리스트

  Group({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.debutDate,
    required this.logo,
    this.artists,
  });

  String? get logoPath {
    if (logo == null) { return null; }
    return '${Config.host}/image/${logo['_id']}';
  }

  factory Group.fromJson(Object? json) =>
      _$GroupFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() =>
      _$GroupToJson(this);
}