import 'package:injectable/injectable.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/domain/enitites/reciter_entity.dart';
import '../../data/models/radio_response_model.dart';
import '../../data/models/reciter_response_model.dart';
import '../../domain/enitites/radio_entity.dart';
import '../../domain/enitites/moshaf_enitity.dart';
import '../../domain/repo/radio_repo.dart';
import '../data_source/radio_remote_data_source_impl.dart';

@Injectable(as: RadioRepo)
class RadioRepoImpl implements RadioRepo {
  final RadioRemoteDataSource _radioRemoteDataSource;

  RadioRepoImpl(this._radioRemoteDataSource);

  @override
  Future<List<RadioEntity>> getRadio() async {
    final RadioResponseModel response =
    await _radioRemoteDataSource.getRadio();

    final entities = response.radios?.map((radio) {
      return RadioEntity(
        id: radio.id ?? 0,
        name: radio.name ?? "",
        url: radio.url ?? "",
        recentDate: DateTime.tryParse(radio.recentDate ?? "") ??
            DateTime.now(),
      );
    }).toList();

    return entities ?? [];
  }

  @override
  Future<List<ReciterEntity>> getReciters() async {
    final ReciterResponseModel response =
    await _radioRemoteDataSource.getReciters();

    final entities = response.reciters?.map((reciter) {
      return ReciterEntity(
        id: reciter.id ?? 0,
        name: reciter.name ?? "",
        letter: reciter.letter ?? "",
        date: DateTime.tryParse(reciter.date ?? "") ?? DateTime.now(),
        moshaf: reciter.moshaf?.map((m) {
          return MoshafEntity(
            id: m.id ?? 0,
            name: m.name ?? "",
            server: m.server ?? "",
            surahTotal: m.surahTotal ?? 0,
            moshafType: m.moshafType ?? 0,
            surahList: (m.surahList ?? "")
                .split(",")
                .map((s) => int.tryParse(s.trim()) ?? 0)
                .toList(),
          );
        }).toList() ??
            [],
      );
    }).toList();

    return entities ?? [];
  }
}
