import '../models/radio_response_model.dart';
import '../models/reciter_response_model.dart';

abstract class RadioRemoteDataSource {
  Future<RadioResponseModel> getRadio();

  Future<ReciterResponseModel> getReciters();
}