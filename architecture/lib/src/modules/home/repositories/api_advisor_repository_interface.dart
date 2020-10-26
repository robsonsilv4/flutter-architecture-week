import 'package:architecture/src/modules/home/models/api_advisor_model.dart';

abstract class IApiAdvisorRepository {
  Future<ApiAdvisorModel> getWeather();
}
