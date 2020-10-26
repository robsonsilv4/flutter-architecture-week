import 'package:flutter/foundation.dart';

import '../models/api_advisor_model.dart';
import '../repositories/api_advisor_repository_interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisorRepository repository;
  final apiAdvisor = ValueNotifier<ApiAdvisorModel>(null);

  ApiAdvisorViewModel(this.repository);

  void fill() async {
    apiAdvisor.value = await repository.getWeather();
  }
}
