import 'package:archive/models/Artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group{

  final String name;  // 그룹명
  final DateTime createdAt;  // 생성 일자
  final DateTime updatedAt;  // 마지막 업데이트 일자
  final DateTime debutDate;  // 데뷔일

  Group({
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.debutDate,
  });

  factory Group.fromJson(Object? json) =>
      _$GroupFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() =>
      _$GroupToJson(this);
}