import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  String commonUrl =
      'https://my-json-server.typicode.com/horizon-code-academy/fake-movies-api/movies';

  Future<List<dynamic>> getMovieData() async {
    final url = Uri.parse(commonUrl);
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      return responseData;
      }
    } catch (error) {
      print(error);
    }
    return [];
  }
}
