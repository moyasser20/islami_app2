import 'package:json_annotation/json_annotation.dart';
import 'prayer_data_model.dart';

part 'prayer_response_model.g.dart';

@JsonSerializable()
class PrayerResponseModel {
  final int? code;
  final String? status;
  final PrayerDataModel? data;

  const PrayerResponseModel({
    this.code,
    this.status,
    this.data,
  });

  factory PrayerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerResponseModelToJson(this);
}
