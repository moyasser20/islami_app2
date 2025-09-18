import '../enitites/radio_entity.dart';
import '../enitites/reciter_entity.dart';

abstract class RadioRepo {
  Future<List<RadioEntity>> getRadio();
  Future<List<ReciterEntity>> getReciters();
}
