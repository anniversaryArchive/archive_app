// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Archive _$ArchiveFromJson(Map<String, dynamic> json) {
  return Archive(
    id: json['_id'] as String,
    name: json['name'] as String,
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ArchiveToJson(Archive instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
    };
