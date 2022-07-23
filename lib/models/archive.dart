import 'package:json_annotation/json_annotation.dart';

part 'archive.g.dart';

@JsonSerializable()
class Archive {
  final String id;
  final double lat;           // 위도
  final double lng;           // 경도
  final String archiveName;   // 카페 이름
  final String themeName;     // 테마 이름
  final String? organizer;    // 주최자 트위터 아이디
  final String address;       // 주소
  final DateTime? startDate;   // 시작 일자
  final DateTime? endDate;     // 종료 일자
  final List<String> images;  // 이미지 path list
  final String? phoneNumber;  // 전화번호
  final String link;          // 공지 link

  Archive({
    required this.id,
    required this.lat,
    required this.lng,
    required this.archiveName,
    required this.themeName,
    this.organizer,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.images,
    this.phoneNumber,
    required this.link,
  });

  factory Archive.fromJson(Object? json) =>
      _$ArchiveFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() =>
      _$ArchiveToJson(this);
}