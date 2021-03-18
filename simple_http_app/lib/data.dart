import 'package:http/http.dart' as http;

class Data {
  Future<String> makeRequestToApi() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', '/photos');
    final response = await http.get(uri);
    return response.body;
  }
}
