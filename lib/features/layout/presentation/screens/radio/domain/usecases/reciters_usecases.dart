

import 'package:injectable/injectable.dart';

import '../enitites/reciter_entity.dart';
import '../repo/radio_repo.dart';

@injectable
class RecitersUseCase {

  final RadioRepo _radioRepo;

  RecitersUseCase(this._radioRepo);

  Future<List<ReciterEntity>> call() async {
    return await _radioRepo.getReciters();
  }
}