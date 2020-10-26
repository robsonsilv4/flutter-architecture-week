import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'repositories/api_advisor_repository.dart';
import 'repositories/api_advisor_repository_interface.dart';
import 'viewmodels/api_advisor_viewmodel.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiAdvisorViewModel(i.get())),
        Bind<IApiAdvisorRepository>(
          (i) => ApiAdvisorRepository(i.get()),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => HomePage()),
      ];
}
