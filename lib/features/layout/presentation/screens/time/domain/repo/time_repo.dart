import '../enitites/sala_timings_entity.dart';

abstract class TimeRepository {
  Future<SalahTimingsEntity> getPrayerTimes({
    required String date,
    required String city,
    required String country,
  });
}
