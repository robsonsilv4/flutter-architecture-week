import 'package:flutter/material.dart';

import '../../models/api_advisor_model.dart';
import '../../repositories/api_advisor_repository.dart';
import '../../services/http_client_service.dart';
import '../../viewmodels/api_advisor_viewmodel.dart';
import 'home_controller.dart';
import 'widgets/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiAdvisorViewModel(
      ApiAdvisorRepository(
        HttpClientService(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiAdvisorModel>(
              valueListenable: controller.weather,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Text(model.text);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          controller.getWeather();
        },
      ),
    );
  }
}
