import 'package:core_module/core_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/home_module.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClientMock extends Mock implements IHttpClient {}

class AppModuleMock extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IHttpClient>((i) => HttpClientMock()),
      ];

  @override
  List<ModularRouter> get routers => [];
}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(
    AppModuleMock(),
    changeBinds: [
      Bind<IHttpClient>((i) => HttpClientMock()),
    ],
  );

  initModule(HomeModule());
  group('ApiAdvisorViewModel', () {
    test('ApiAdvisorViewModel error', () async {
      when(
        Modular.get<IHttpClient>().get(any),
      ).thenThrow(
        Exception(),
      );

      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisor.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(
        Modular.get<IHttpClient>().get(any),
      ).thenAnswer(
        (_) => Future.value(
          [
            ApiAdvisorModel(
              country: 'BR',
              date: '10/26/2020',
              text: 'Rain, rain, rain...',
            ).toJson(),
          ],
        ),
      );

      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisor.value, isA<ApiAdvisorModel>());
    });
  });
}
