import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/USD";
  final String apikey = "EA84FA41-DACA-4DA6-9064-5A6C39501B6F";

  Future getCoinData() async {
    String finalURL = baseURL + "?apikey=" + apikey;
    print(finalURL);
    http.Response response = await http.get(finalURL);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      var decodedBody = jsonDecode(responseBody);
      print(decodedBody);
      var usdRate = decodedBody["rate"];
      print(usdRate);
      return usdRate;
    } else {
      print("Failed to init");
    }
  }
}
