import 'package:dio/dio.dart';

import '../../domain/errors/errors.dart';
import '../../infra/datasources/search_datasource.dart';
import '../../infra/models/result_search_model.dart';

extension on String {
  normalize() {
    return this.replaceAll(' ', '+');
  }
}

class GitHubDataSource implements SearchDataSource {
  final Dio dio;

  GitHubDataSource(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get(
      'https://api.github.com/search/users?q=${searchText.normalize()}',
    );
    if (response.statusCode == 200) {
      final list = (response.data['items'] as List)
          .map((item) => ResultSearchModel.fromMap(item))
          .toList();
      return list;
    } else {
      throw DataSourceError();
    }
  }
}
