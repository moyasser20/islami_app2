import 'package:islami_app2/features/layout/presentation/screens/time/data/models/sala_timing_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_data_model.g.dart';

@JsonSerializable()
class PrayerDataModel {
  final SalahTimingsModel? timings;

  const PrayerDataModel({this.timings});

  factory PrayerDataModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerDataModelToJson(this);
}
