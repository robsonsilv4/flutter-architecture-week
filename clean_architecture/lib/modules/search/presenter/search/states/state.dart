import '../../../domain/entities/result_search.dart';
import '../../../domain/errors/errors.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError(this.error);
}

class SearchLoading implements SearchState {}

class SearchStart implements SearchState {}
