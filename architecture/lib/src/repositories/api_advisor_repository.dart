import '../interfaces/http_client_service_interface.dart';
import '../models/api_advisor_model.dart';
import 'api_advisor_repository_interface.dart';

class ApiAdvisorRepository implements IApiAdvisorRepository {
  final IHttpClient httpClient;

  ApiAdvisorRepository(this.httpClient);

  @override
  Future<ApiAdvisorModel> getWeather() async {
    final json = await httpClient.get(
      'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f',
    );
    final weather = ApiAdvisorModel.fromJson(json[0]);
    return weather;
  }
}
