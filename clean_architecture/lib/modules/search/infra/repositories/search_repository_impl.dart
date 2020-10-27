import 'package:dartz/dartz.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
    String searchText,
  ) async {
    try {
      final result = await dataSource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (error) {
      return Left(error);
    } catch (error) {
      return Left(DataSourceError());
    }
  }
}
