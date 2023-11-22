// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostDataUiModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostDataUiModel.fromMap(Map<String, dynamic> map) {
    return PostDataUiModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostDataUiModel.fromJson(String source) =>
      PostDataUiModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
