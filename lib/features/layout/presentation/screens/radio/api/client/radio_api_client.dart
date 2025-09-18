
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../../../core/constants/api/end_points.dart';
import '../../data/models/radio_response_model.dart';
import '../../data/models/reciter_response_model.dart';

part 'radio_api_client.g.dart';
@injectable
@RestApi()
abstract class RadioApiClient {

  @factoryMethod
  factory RadioApiClient(Dio dio, {@Named('baseurl') String? baseUrl}) = _RadioApiClient;

  @GET(EndPoints.radio)
  Future<RadioResponseModel> getRadio();

  @GET(EndPoints.reciters)
  Future<ReciterResponseModel> getReciters();
}