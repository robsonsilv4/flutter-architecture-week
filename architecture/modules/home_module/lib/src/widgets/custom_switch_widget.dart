import 'package:core_module/core_module.dart' show ChangeThemeViewModel;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSwitchWidget extends StatefulWidget {
  @override
  _CustomSwitchWidgetState createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Modular.get<ChangeThemeViewModel>().config.themeSwitch,
      builder: (context, isDark, child) {
        return Switch(
          value: isDark,
          onChanged: Modular.get<ChangeThemeViewModel>().changeTheme,
        );
      },
    );
  }
}
