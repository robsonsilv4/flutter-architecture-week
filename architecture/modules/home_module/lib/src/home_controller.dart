import 'package:flutter/widgets.dart';

import 'models/api_advisor_model.dart';
import 'viewmodels/api_advisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get weather => viewModel.apiAdvisor;

  void getWeather() {
    viewModel.fill();
  }
}
