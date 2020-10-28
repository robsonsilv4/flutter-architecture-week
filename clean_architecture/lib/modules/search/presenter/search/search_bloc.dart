import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

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

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 800),
      ),
      transitionFn,
    );
  }
}
