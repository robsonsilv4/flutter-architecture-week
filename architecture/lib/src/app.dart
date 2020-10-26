import 'package:architecture/src/controllers/app_controller.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Architecture',
          theme: ThemeData(
            brightness: isDark ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        );
      },
    );
  }
}
