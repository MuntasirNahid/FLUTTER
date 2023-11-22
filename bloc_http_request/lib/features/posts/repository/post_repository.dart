import 'dart:convert';

import 'package:bloc_http_request/features/posts/model/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts',
        ),
      );

      List<PostDataUiModel> posts = [];

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post = PostDataUiModel.fromMap(result[i]);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addNewPost() async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts',
        ),
        body: {
          "title": "hello World",
          "body": "This is body",
          "userId": "1",
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
