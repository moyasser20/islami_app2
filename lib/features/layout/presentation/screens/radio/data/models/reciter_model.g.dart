// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reciters _$RecitersFromJson(Map<String, dynamic> json) => Reciters(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      letter: json['letter'] as String?,
      date: json['date'] as String?,
      moshaf: (json['moshaf'] as List<dynamic>?)
          ?.map((e) => Moshaf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecitersToJson(Reciters instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'letter': instance.letter,
      'date': instance.date,
      'moshaf': instance.moshaf,
    };
