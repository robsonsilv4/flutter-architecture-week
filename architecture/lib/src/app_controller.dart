import 'package:flutter/foundation.dart';

import 'interfaces/local_storage_interface.dart';
import 'services/local_storage_service.dart';
import 'viewmodels/change_theme_viewmodel.dart';

class AppController {
  static final AppController instance = AppController._();

  final ILocalStorage localStorage = LocalStorageService();
  final changeThemeViewModel = ChangeThemeViewModel(
    localStorage: LocalStorageService(),
  );

  AppController._() {
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
