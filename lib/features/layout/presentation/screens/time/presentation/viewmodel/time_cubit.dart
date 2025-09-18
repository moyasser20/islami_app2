import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../viewmodel/time_states.dart';
import '../../domain/usecases/time_usecase.dart';

@injectable
class TimeCubit extends Cubit<TimeStates> {
  final GetPrayerTimesUseCase getPrayerTimesUseCase;

  TimeCubit(this.getPrayerTimesUseCase) : super(TimeInitialState());

  Future<void> getPrayerTimes({
    required String date,
    required String city,
    required String country,
  }) async {
    emit(TimeLoadingState());
    try {
      final result = await getPrayerTimesUseCase.call(
        date: date,
        city: city,
        country: country,
      );
      emit(TimeSuccessState(result));
    } catch (e) {
      emit(TimeErrorState(e.toString()));
    }
  }

  DateTime _parseTime(String? time, DateTime now) {
    if (time == null || time.isEmpty) return now;
    final parts = time.split(':');
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  Map<String, dynamic> getNextPrayer(timings) {
    final now = DateTime.now();

    final prayers = {
      "Fajr": _parseTime(timings.fajr, now),
      "Dhuhr": _parseTime(timings.dhuhr, now),
      "Asr": _parseTime(timings.asr, now),
      "Maghrib": _parseTime(timings.maghrib, now),
      "Isha": _parseTime(timings.isha, now),
    };

    String nextPrayerName = "";
    Duration timeLeft = Duration.zero;

    for (var entry in prayers.entries) {
      if (entry.value.isAfter(now)) {
        nextPrayerName = entry.key;
        timeLeft = entry.value.difference(now);
        break;
      }
    }

    if (nextPrayerName.isEmpty) {
      nextPrayerName = "Fajr";
      timeLeft =
          prayers["Fajr"]!.add(const Duration(days: 1)).difference(now);
    }

    return {
      "name": nextPrayerName,
      "timeLeft": timeLeft,
    };
  }
}
