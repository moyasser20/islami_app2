
import '../../domain/enitites/radio_entity.dart';
import '../../domain/enitites/reciter_entity.dart';

abstract class RadioState {}

class RadioInitialState extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioSuccessState extends RadioState {
  final List<RadioEntity> radios;
  final List<ReciterEntity> reciters;


  RadioSuccessState(this.radios, this.reciters);
}

class RadioErrorState extends RadioState {
  final String message;

  RadioErrorState(this.message);
}
