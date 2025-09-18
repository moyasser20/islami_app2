// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioResponseModel _$RadioResponseModelFromJson(Map<String, dynamic> json) =>
    RadioResponseModel(
      radios: (json['radios'] as List<dynamic>?)
          ?.map((e) => Radios.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RadioResponseModelToJson(RadioResponseModel instance) =>
    <String, dynamic>{
      'radios': instance.radios,
    };
