import 'prayer_data_entity.dart';

class PrayerResponseEntity {
  final int? code;
  final String? status;
  final PrayerDataEntity? data;

  const PrayerResponseEntity({
    this.code,
    this.status,
    this.data,
  });
}
