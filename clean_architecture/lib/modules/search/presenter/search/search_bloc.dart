import 'package:bloc/bloc.dart';

import '../../domain/usecases/search_by_text.dart';
import 'states/state.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText useCase;

  SearchBloc(this.useCase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await useCase(searchText);
    yield result.fold(
      (l) => SearchError(l),
      (r) => SearchSuccess(r),
    );
  }
}
