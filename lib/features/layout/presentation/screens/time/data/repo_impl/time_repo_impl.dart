import 'package:injectable/injectable.dart';
import '../../domain/enitites/sala_timings_entity.dart';
import '../../domain/repo/time_repo.dart';
import '../data_source/time_remote_data_source.dart';

@LazySingleton(as: TimeRepository)
class TimeRepositoryImpl implements TimeRepository {
  final TimeRemoteDataSource remoteDataSource;

  TimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<SalahTimingsEntity> getPrayerTimes({
    required String date,
    required String city,
    required String country,
  }) async {
    final response = await remoteDataSource.getPrayerTimes(
      date: date,
      city: city,
      country: country,
    );

    final timings = response.data?.timings;

    return SalahTimingsEntity(
      fajr: timings?.fajr,
      dhuhr: timings?.dhuhr,
      asr: timings?.asr,
      maghrib: timings?.maghrib,
      isha: timings?.isha,
    );
  }
}
