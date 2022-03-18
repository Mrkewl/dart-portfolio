import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> getData(String url) {
    return http.get(Uri.parse(url));
  }

  Future<http.Response> postData({
    required String url,
    required String headers,
    required String body,
    
  }) {
    return http.post(
      Uri.parse(url),
    );
  }
}
