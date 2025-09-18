import 'package:injectable/injectable.dart';

import '../enitites/sala_timings_entity.dart';
import '../repo/time_repo.dart';

@injectable
class GetPrayerTimesUseCase {
  final TimeRepository _repository;

  GetPrayerTimesUseCase(this._repository);

  Future<SalahTimingsEntity> call({
    required String date,
    required String city,
    required String country,
  }) async {
    return await _repository.getPrayerTimes(
      date: date,
      city: city,
      country: country,
    );
  }
}
