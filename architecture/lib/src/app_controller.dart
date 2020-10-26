import 'package:flutter/foundation.dart';

import 'interfaces/local_storage_interface.dart';
import 'models/app_config_model.dart';
import 'services/local_storage_service.dart';

class AppController {
  static final AppController instance = AppController._();

  final config = AppConfigModel();
  final ILocalStorage localStorage = LocalStorageService();

  AppController._() {
    localStorage.get('isDark').then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  bool get isDark => config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    localStorage.put('isDark', value);
  }
}
