// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Radios _$RadiosFromJson(Map<String, dynamic> json) => Radios(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      url: json['url'] as String?,
      recentDate: json['recent_date'] as String?,
    );

Map<String, dynamic> _$RadiosToJson(Radios instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'recent_date': instance.recentDate,
    };
