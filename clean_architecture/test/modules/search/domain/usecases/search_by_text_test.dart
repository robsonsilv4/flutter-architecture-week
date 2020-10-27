import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final useCase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any)).thenAnswer(
      (_) async => Right(<ResultSearch>[]),
    );
    final result = await useCase('search');
    expect(result | null, isA<List<ResultSearch>>());
  });

  test('deve retornar um IvalidTextError caso o texto seja inválido', () async {
    when(repository.search(any)).thenAnswer(
      (_) async => Right(<ResultSearch>[]),
    );
    var result = await useCase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await useCase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
