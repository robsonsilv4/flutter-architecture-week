import 'package:architecture/src/interfaces/http_client_service_interface.dart';
import 'package:architecture/src/models/api_advisor_model.dart';
import 'package:architecture/src/repositories/api_advisor_repository.dart';
import 'package:architecture/src/viewmodels/api_advisor_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HttpClientMock extends Mock implements IHttpClient {}

main() {
  final httpClientMock = HttpClientMock();

  group('ApiAdvisorViewModel', () {
    final viewModel = ApiAdvisorViewModel(
      ApiAdvisorRepository(
        httpClientMock,
      ),
    );

    test('ApiAdvisorViewModel error', () async {
      when(
        httpClientMock.get(any),
      ).thenThrow(
        Exception(),
      );
      await viewModel.fill();
      expect(viewModel.apiAdvisor.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(
        httpClientMock.get(any),
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
      await viewModel.fill();
      expect(viewModel.apiAdvisor.value, isA<ApiAdvisorModel>());
    });
  });
}
