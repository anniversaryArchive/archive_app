// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
    name: json['name'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    debutDate: DateTime.parse(json['debutDate'] as String),
    birthDay: DateTime.parse(json['birthDay'] as String),
    group:
        json['group'] == null ? null : Group.fromJson(json['group'] as Object),
  );
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'debutDate': instance.debutDate.toIso8601String(),
      'birthDay': instance.birthDay.toIso8601String(),
      'group': instance.group,
    };
