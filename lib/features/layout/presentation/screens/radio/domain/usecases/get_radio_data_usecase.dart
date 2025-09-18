import 'package:injectable/injectable.dart';

import '../enitites/radio_entity.dart';
import '../repo/radio_repo.dart';

@injectable
class GetRadioDataUseCase {
  final RadioRepo _radioRepo;

  GetRadioDataUseCase(this._radioRepo);

  Future<List<RadioEntity>> call() async {
    return await _radioRepo.getRadio();
  }

}