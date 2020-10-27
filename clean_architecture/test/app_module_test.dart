import 'dart:convert';

import 'package:clean_architecture/app_module.dart';
import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();

  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('deve recuperar o use case sem erro', () {
    final useCase = Modular.get<SearchByText>();
    expect(useCase, isA<SearchByText>());
  });

  test('deve recuperar o use case sem erro', () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonDecode(gitHubResult),
        statusCode: 200,
      ),
    );
    final useCase = Modular.get<SearchByText>();
    final result = await useCase('robson');
    expect(result | null, isA<List<ResultSearch>>());
  });
}
