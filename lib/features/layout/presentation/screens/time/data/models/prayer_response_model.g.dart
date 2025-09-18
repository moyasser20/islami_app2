// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerResponseModel _$PrayerResponseModelFromJson(Map<String, dynamic> json) =>
    PrayerResponseModel(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : PrayerDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerResponseModelToJson(
        PrayerResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };
