// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/layout/presentation/screens/radio/api/client/radio_api_client.dart'
    as _i1064;
import '../../features/layout/presentation/screens/radio/api/data_source_impl/radio_remote_data_source_impl.dart'
    as _i4;
import '../../features/layout/presentation/screens/radio/data/data_source/radio_remote_data_source_impl.dart'
    as _i299;
import '../../features/layout/presentation/screens/radio/data/repo_impl/radio_repo_impl.dart'
    as _i889;
import '../../features/layout/presentation/screens/radio/domain/repo/radio_repo.dart'
    as _i845;
import '../../features/layout/presentation/screens/radio/domain/usecases/get_radio_data_usecase.dart'
    as _i160;
import '../../features/layout/presentation/screens/radio/domain/usecases/reciters_usecases.dart'
    as _i219;
import '../../features/layout/presentation/screens/radio/presentation/viewmodel/radio_cubit.dart'
    as _i328;
import '../../features/layout/presentation/screens/time/api/client/time_api_client.dart'
    as _i854;
import '../../features/layout/presentation/screens/time/api/data_source_impl/time_remote_data_source_impl.dart'
    as _i102;
import '../../features/layout/presentation/screens/time/data/data_source/time_remote_data_source.dart'
    as _i655;
import '../../features/layout/presentation/screens/time/data/repo_impl/time_repo_impl.dart'
    as _i385;
import '../../features/layout/presentation/screens/time/domain/repo/time_repo.dart'
    as _i1030;
import '../../features/layout/presentation/screens/time/domain/usecases/time_usecase.dart'
    as _i293;
import '../../features/layout/presentation/screens/time/presentation/viewmodel/time_cubit.dart'
    as _i648;
import 'module/dio_module.dart' as _i556;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dioTime(),
      instanceName: 'time',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dioQuran(),
      instanceName: 'quran',
    );
    gh.factory<_i854.TimeApiClient>(
        () => _i854.TimeApiClient(gh<_i361.Dio>(instanceName: 'time')));
    gh.factory<_i1064.RadioApiClient>(
        () => _i1064.RadioApiClient(gh<_i361.Dio>(instanceName: 'quran')));
    gh.lazySingleton<_i655.TimeRemoteDataSource>(
        () => _i102.TimeRemoteDataSourceImpl(gh<_i854.TimeApiClient>()));
    gh.lazySingleton<_i299.RadioRemoteDataSource>(
        () => _i4.RadioRemoteDataSourceImpl(gh<_i1064.RadioApiClient>()));
    gh.lazySingleton<_i1030.TimeRepository>(
        () => _i385.TimeRepositoryImpl(gh<_i655.TimeRemoteDataSource>()));
    gh.factory<_i845.RadioRepo>(
        () => _i889.RadioRepoImpl(gh<_i299.RadioRemoteDataSource>()));
    gh.factory<_i160.GetRadioDataUseCase>(
        () => _i160.GetRadioDataUseCase(gh<_i845.RadioRepo>()));
    gh.factory<_i219.RecitersUseCase>(
        () => _i219.RecitersUseCase(gh<_i845.RadioRepo>()));
    gh.factory<_i293.GetPrayerTimesUseCase>(
        () => _i293.GetPrayerTimesUseCase(gh<_i1030.TimeRepository>()));
    gh.factory<_i648.TimeCubit>(
        () => _i648.TimeCubit(gh<_i293.GetPrayerTimesUseCase>()));
    gh.factory<_i328.RadioCubit>(() => _i328.RadioCubit(
          gh<_i160.GetRadioDataUseCase>(),
          gh<_i219.RecitersUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i556.DioModule {}
