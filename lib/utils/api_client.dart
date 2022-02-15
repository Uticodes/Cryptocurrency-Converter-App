import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient{
  final Uri currencyUrl = Uri.https("network.fixer.io", "/api/latest",
      {"access_key": "7d82f4c0b95c2f8790be612eff2619ab"});

  Future<List<String>?> getCurrencies() async {
    http.Response response = await http.get(currencyUrl);
    if(response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var list = body["rates"];
      List<String> currencies = (list).toList();
      print(currencies);
      return currencies;
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}