// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerDataModel _$PrayerDataModelFromJson(Map<String, dynamic> json) =>
    PrayerDataModel(
      timings: json['timings'] == null
          ? null
          : SalahTimingsModel.fromJson(json['timings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerDataModelToJson(PrayerDataModel instance) =>
    <String, dynamic>{
      'timings': instance.timings,
    };
