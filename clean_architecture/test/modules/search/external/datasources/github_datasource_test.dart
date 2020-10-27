import 'dart:convert';

import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final dataSource = GitHubDataSource(dio);

  test(
    'deve retornar uma lista de ResultSearchModel',
    () async {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: jsonDecode(gitHubResult),
          statusCode: 200,
        ),
      );
      final future = dataSource.getSearch('search');
      expect(future, completes);
    },
  );

  test(
    'deve retornar um erro se o código não for 200',
    () async {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: null,
          statusCode: 401,
        ),
      );
      final future = dataSource.getSearch('search');
      expect(future, throwsA(isA<DataSourceError>()));
    },
  );

  test(
    'deve retornar um Exception se tiver um erro no Dio',
    () async {
      when(dio.get(any)).thenThrow(Exception());
      final future = dataSource.getSearch('search');
      expect(future, throwsA(isA<Exception>()));
    },
  );
}
