// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Archive _$ArchiveFromJson(Map<String, dynamic> json) {
  return Archive(
    id: json['_id'] as String,
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    archiveName: json['archiveName'] as String,
    themeName: json['themeName'] as String,
    organizer: json['organizer'] as String?,
    address: json['address'] as String,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    images: (json['images'] as List<dynamic>).map((e) => (e?['_id'] ?? '') as String).toList(),
    phoneNumber: json['phoneNumber'] as String?,
    link: json['link'] as String,
  );
}

Map<String, dynamic> _$ArchiveToJson(Archive instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'archiveName': instance.archiveName,
      'themeName': instance.themeName,
      'organizer': instance.organizer,
      'address': instance.address,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'images': instance.images,
      'phoneNumber': instance.phoneNumber,
      'link': instance.link,
    };
