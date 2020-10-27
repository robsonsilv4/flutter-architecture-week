import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'modules/search/domain/usecases/search_by_text.dart';
import 'modules/search/external/datasources/github_datasource.dart';
import 'modules/search/infra/repositories/search_repository_impl.dart';
import 'modules/search/presenter/search/search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GitHubDataSource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
      ];

  @override
  Widget get bootstrap => App();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchPage()),
      ];
}
