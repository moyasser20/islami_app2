
import 'package:injectable/injectable.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/data/models/radio_response_model.dart';
import 'package:islami_app2/features/layout/presentation/screens/radio/data/models/reciter_response_model.dart';

import '../../data/data_source/radio_remote_data_source_impl.dart';
import '../client/radio_api_client.dart';

@LazySingleton(as:RadioRemoteDataSource )
class RadioRemoteDataSourceImpl implements RadioRemoteDataSource {
  final RadioApiClient radioApiClient;

  RadioRemoteDataSourceImpl(this.radioApiClient);

  @override
  Future<RadioResponseModel> getRadio() async{
    return await radioApiClient.getRadio();
  }

  @override
  Future<ReciterResponseModel> getReciters() async{
    return await radioApiClient.getReciters();
  }


}