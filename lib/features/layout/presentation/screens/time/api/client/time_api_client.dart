import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_app2/features/layout/presentation/screens/time/data/models/prayer_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../../../core/constants/api/api_constants.dart';
import '../../../../../../../core/constants/api/end_points.dart';


part 'time_api_client.g.dart';
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl2)
abstract class TimeApiClient {
  @factoryMethod
  factory TimeApiClient(@Named("time") Dio dio) = _TimeApiClient;

  @GET("${EndPoints.timingsByCity}/{date}")
  Future<PrayerResponseModel> getPrayerTimes(
      @Path("date") String date,
      @Query("city") String city,
      @Query("country") String country,
      );
}
