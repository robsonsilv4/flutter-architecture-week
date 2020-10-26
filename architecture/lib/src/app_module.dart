import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'app_controller.dart';
import 'core/interfaces/http_client_service_interface.dart';
import 'core/interfaces/local_storage_interface.dart';
import 'core/services/http_client_service.dart';
import 'core/services/local_storage_service.dart';
import 'core/viewmodels/change_theme_viewmodel.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind<IHttpClient>((i) => HttpClientService()),
      Bind((i) => AppController(i.get()), lazy: false),
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
