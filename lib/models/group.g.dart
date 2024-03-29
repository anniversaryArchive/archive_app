// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['_id'] as String,
    name: json['name'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    debutDate: DateTime.parse(json['debutDate'] as String),
    logo: json['logo'],
    artists: (json['artists'] as List<dynamic>?)
        ?.map((e) => Artist.fromJson(e as Object))
        .toList(),
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'debutDate': instance.debutDate.toIso8601String(),
      'logo': instance.logo,
      'artists': instance.artists,
    };
