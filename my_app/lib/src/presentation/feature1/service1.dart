import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void service1() async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = Uri.https('catfact.ninja', '/fact', {'q': '{https}'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['fact'];
    print('Result: $itemCount.');
  } else {
    print('Result: ${response.statusCode}.');
  }
}
