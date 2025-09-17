
import '../../domain/enitites/radio_entity.dart';

abstract class RadioState {}

class RadioInitialState extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioSuccessState extends RadioState {
  final List<RadioEntity> radios;

  RadioSuccessState(this.radios);
}

class RadioErrorState extends RadioState {
  final String message;

  RadioErrorState(this.message);
}
