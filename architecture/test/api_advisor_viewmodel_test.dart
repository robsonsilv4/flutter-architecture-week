import 'package:architecture/src/app_module.dart';
import 'package:architecture/src/core/interfaces/http_client_service_interface.dart';
import 'package:architecture/src/modules/home/home_module.dart';
import 'package:architecture/src/modules/home/models/api_advisor_model.dart';
import 'package:architecture/src/modules/home/viewmodels/api_advisor_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClientMock extends Mock implements IHttpClient {}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(
    AppModule(),
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
