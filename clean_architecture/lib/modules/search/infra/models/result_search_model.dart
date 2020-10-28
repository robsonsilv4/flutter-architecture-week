import 'dart:convert';

import '../../domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String login;
  final int id;
  final String avatarUrl;

  ResultSearchModel({
    this.login,
    this.id,
    this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'id': id,
      'avatar_url': avatarUrl,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ResultSearchModel(
      login: map['login'],
      id: map['id'],
      avatarUrl: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) => fromMap(
        json.decode(source),
      );
}
