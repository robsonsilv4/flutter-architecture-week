import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'app_controller.dart';
import 'interfaces/http_client_service_interface.dart';
import 'interfaces/local_storage_interface.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'repositories/api_advisor_repository.dart';
import 'repositories/api_advisor_repository_interface.dart';
import 'services/http_client_service.dart';
import 'services/local_storage_service.dart';
import 'viewmodels/api_advisor_viewmodel.dart';
import 'viewmodels/change_theme_viewmodel.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => HomeController(i.get())),
      Bind((i) => ApiAdvisorViewModel(i.get())),
      Bind<IApiAdvisorRepository>(
        (i) => ApiAdvisorRepository(i.get()),
      ),
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
        ModularRouter('/', child: (_, __) => LoginPage()),
        ModularRouter('/home', child: (_, __) => HomePage()),
      ];
}
