
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_app2/features/layout/presentation/screens/time/presentation/viewmodel/time_states.dart';
import '../../domain/usecases/time_usecase.dart';

@injectable
class TimeCubit extends Cubit<TimeStates> {
  final GetPrayerTimesUseCase getPrayerTimesUseCase;

  TimeCubit(this.getPrayerTimesUseCase) : super(TimeInitialState());


  Future<void> getPrayerTimes({
    required String date,
    required String city,
    required String country,
})async {
    emit(TimeLoadingState());
    try {
      final result = await getPrayerTimesUseCase.call(
          date: date, city: city, country: country);

      emit(TimeSuccessState(result));
    }catch(e){
      emit(TimeErrorState(e.toString()));
    }
  }

}