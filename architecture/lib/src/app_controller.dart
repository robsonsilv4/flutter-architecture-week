import 'package:flutter/foundation.dart';

class AppController {
  static final AppController instance = AppController._();

  final themeSwitch = ValueNotifier<bool>(false);

  AppController._();

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
