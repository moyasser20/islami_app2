// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciterResponseModel _$ReciterResponseModelFromJson(
        Map<String, dynamic> json) =>
    ReciterResponseModel(
      reciters: (json['reciters'] as List<dynamic>?)
          ?.map((e) => Reciters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReciterResponseModelToJson(
        ReciterResponseModel instance) =>
    <String, dynamic>{
      'reciters': instance.reciters,
    };
