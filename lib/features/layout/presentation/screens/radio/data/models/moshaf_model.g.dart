// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moshaf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moshaf _$MoshafFromJson(Map<String, dynamic> json) => Moshaf(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      server: json['server'] as String?,
      surahTotal: (json['surah_total'] as num?)?.toInt(),
      moshafType: (json['moshaf_type'] as num?)?.toInt(),
      surahList: json['surah_list'] as String?,
    );

Map<String, dynamic> _$MoshafToJson(Moshaf instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'server': instance.server,
      'surah_total': instance.surahTotal,
      'moshaf_type': instance.moshafType,
      'surah_list': instance.surahList,
    };
