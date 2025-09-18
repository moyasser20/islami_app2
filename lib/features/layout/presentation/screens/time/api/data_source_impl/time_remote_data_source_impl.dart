import 'package:injectable/injectable.dart';

import '../../data/data_source/time_remote_data_source.dart';
import '../../data/models/prayer_response_model.dart';
import '../client/time_api_client.dart';

@LazySingleton(as: TimeRemoteDataSource)
class TimeRemoteDataSourceImpl implements TimeRemoteDataSource {
  final TimeApiClient timeApiClient;

  TimeRemoteDataSourceImpl(this.timeApiClient);

  @override
  Future<PrayerResponseModel> getPrayerTimes({
    required String date,
    required String city,
    required String country,
  }) async {
    return await timeApiClient.getPrayerTimes(date, city, country);
  }
}
