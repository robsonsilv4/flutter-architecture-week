import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/api_advisor_model.dart';
import 'home_controller.dart';
import 'widgets/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

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
