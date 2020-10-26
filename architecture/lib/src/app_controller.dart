import 'package:flutter/foundation.dart';

import 'models/app_config_model.dart';

class AppController {
  static final AppController instance = AppController._();

  final config = AppConfigModel();

  AppController._();

  bool get isDark => config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    config.themeSwitch.value = value;
  }
}
