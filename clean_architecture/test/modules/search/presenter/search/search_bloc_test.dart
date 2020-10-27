import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_architecture/modules/search/presenter/search/search_bloc.dart';
import 'package:clean_architecture/modules/search/presenter/search/states/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final useCase = SearchByTextMock();
  final bloc = SearchBloc(useCase);

  test('deve retornar os estados na ordem correta', () async {
    when(useCase(any)).thenAnswer(
      (_) async => Right(
        <ResultSearch>[],
      ),
    );
    expect(
      bloc,
      emitsInOrder([
        isA<SearchLoading>(),
        isA<SearchSuccess>(),
      ]),
    );
    bloc.add('search');
  });

  test('deve retornar error', () async {
    when(useCase(any)).thenAnswer(
      (_) async => Left(InvalidTextError()),
    );
    expect(
      bloc,
      emitsInOrder([
        isA<SearchLoading>(),
        isA<SearchError>(),
      ]),
    );
    bloc.add('search');
  });
}
