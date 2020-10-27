import '../interfaces/local_storage_interface.dart';
import '../models/app_config_model.dart';

class ChangeThemeViewModel {
  final config = AppConfigModel();
  final ILocalStorage localStorage;

  ChangeThemeViewModel({this.localStorage});

  Future init() async {
    await localStorage.get('isDark').then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    localStorage.put('isDark', value);
  }
}
