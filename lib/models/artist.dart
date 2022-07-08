// import 'package:archive/models/group.dart';
import 'package:archive/models/group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable()
class Artist {

  final String name; // 아티스트 명
  final DateTime createdAt; // 생성 일자
  final DateTime updatedAt; // 마지막 업데이트 일자
  final DateTime debutDate; // 데뷔일
  final DateTime birthDay; // 생일
  final Group? group; // 아티스트가 속한 그룹

  Artist({
    required this.name,
    required this.createdAt,
    this.updatedAt,
    required this.debutDate,
    required this.birthDay,
    this.group,
  });

  factory Artist.fromJson(Object? json) =>
      _$ArtistFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() =>
      _$ArtistToJson(this);
}
