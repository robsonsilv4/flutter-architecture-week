import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_module/home_module.dart';
import 'package:login_module/login_module.dart';

import 'app.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind<IHttpClient>((i) => HttpClientService()),
      Bind(
        (i) => ChangeThemeViewModel(
          localStorage: i.get(),
        ),
      ),
      Bind<ILocalStorage>((i) => LocalStorageService()),
    ];
  }

  @override
  Widget get bootstrap => App();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];
}
