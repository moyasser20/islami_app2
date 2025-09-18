import 'package:json_annotation/json_annotation.dart';

part 'sala_timing_model.g.dart';

@JsonSerializable()
class SalahTimingsModel {
  @JsonKey(name: "Fajr")
  final String? fajr;

  @JsonKey(name: "Sunrise")
  final String? sunrise;

  @JsonKey(name: "Dhuhr")
  final String? dhuhr;

  @JsonKey(name: "Asr")
  final String? asr;

  @JsonKey(name: "Sunset")
  final String? sunset;

  @JsonKey(name: "Maghrib")
  final String? maghrib;

  @JsonKey(name: "Isha")
  final String? isha;

  @JsonKey(name: "Imsak")
  final String? imsak;

  @JsonKey(name: "Midnight")
  final String? midnight;

  @JsonKey(name: "Firstthird")
  final String? firstThird;

  @JsonKey(name: "Lastthird")
  final String? lastThird;

  const SalahTimingsModel({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstThird,
    this.lastThird,
  });

  factory SalahTimingsModel.fromJson(Map<String, dynamic> json) =>
      _$SalahTimingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalahTimingsModelToJson(this);
}
