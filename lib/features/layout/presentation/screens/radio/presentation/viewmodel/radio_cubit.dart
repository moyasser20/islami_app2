import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/domain/usecases/get_radio_data_usecase.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/presentation/viewmodel/radio_states.dart';

import '../../domain/enitites/radio_entity.dart';
import '../../domain/enitites/reciter_entity.dart';
import '../../domain/usecases/reciters_usecases.dart';

@injectable
class RadioCubit extends Cubit<RadioState> {

  final GetRadioDataUseCase _radioRepo;
  final RecitersUseCase _recitersRepo;

  RadioCubit(this._radioRepo, this._recitersRepo) :super (RadioInitialState());

  Future<void> getRadioData() async {
    emit(RadioLoadingState());
    try {
      final List<RadioEntity> radios = await _radioRepo();
      final List<ReciterEntity> reciters = await _recitersRepo();
      emit(RadioSuccessState(radios, reciters));
    }catch(e) {
      emit(RadioErrorState(e.toString()));
    }
  }
}