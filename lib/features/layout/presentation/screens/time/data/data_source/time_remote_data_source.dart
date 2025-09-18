import '../models/prayer_response_model.dart';

abstract class TimeRemoteDataSource {
  Future<PrayerResponseModel> getPrayerTimes({
    required String date,
    required String city,
    required String country,
  });
}
