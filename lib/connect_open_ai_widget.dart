/// 
/// PROJECT_NAME: hukumai & FILE_NAME: connect_open_ai
/// Created by Vinoth Kumar on 30/07/23.
///
///
import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiKey = 'OPENAI_API_KEY';
final String apiUrl = 'https://api.openai.com/v1/engines/davinci-codex/completions';

Future<String?> generatePoem(String prompt) async {
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  final body = {
    'prompt': 'Write a poem about a cat.\n$prompt',
    'max_tokens': 100,
  };

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    // Successful response
    return response.body;
  } else {
    // Handle error here
    print('API request failed with status code: ${response.statusCode}');
    return null;
  }
}
