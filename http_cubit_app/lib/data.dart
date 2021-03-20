import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_cubit_app/data_model.dart';

class Data {
  final _url = 'jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.https(_url, '/posts');
      final response = await http.get(uri);
      final json = jsonDecode(response.body) as List;
      final posts = json.map((post) => Post.fromJson(post)).toList();
      return posts;
    } catch (e) {
      throw e;
    }
  }
}
