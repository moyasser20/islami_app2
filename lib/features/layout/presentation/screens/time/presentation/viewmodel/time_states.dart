import '../../domain/enitites/sala_timings_entity.dart';

abstract class TimeStates{}

class TimeInitialState extends TimeStates{}

class TimeLoadingState  extends TimeStates{}

class TimeSuccessState extends TimeStates{
  final SalahTimingsEntity salahTimingsEntity;
  TimeSuccessState(this.salahTimingsEntity);

}

class TimeErrorState  extends TimeStates{
  final String message;
  TimeErrorState(this.message);
}

