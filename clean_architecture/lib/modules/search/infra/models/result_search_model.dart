import 'dart:convert';

import '../../domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String content;
  final String image;

  ResultSearchModel({
    this.title,
    this.content,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'image': image,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return ResultSearchModel(
      title: map['title'],
      content: map['content'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) => fromMap(
        json.decode(source),
      );
}
