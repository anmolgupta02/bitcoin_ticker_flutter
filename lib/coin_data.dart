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
  String baseURL = "https://rest.coinapi.io/v1/exchangerate/";

  // String selectedCurrencyFromSelector = "PLN";
  final String apikey = "EA84FA41-DACA-4DA6-9064-5A6C39501B6F";

  Future getCoinDataInBTC(String selectedCurrencyFromSelector) async {
    String coin = "BTC";
    String finalURL = baseURL +
        coin +
        "/" +
        selectedCurrencyFromSelector +
        "?apikey=" +
        apikey;
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
      return "Null Data";
    }
  }

  Future getCoinDataInETH(String selectedCurrencyFromSelector) async {
    String coin = "ETH";
    String finalURL = baseURL +
        coin +
        "/" +
        selectedCurrencyFromSelector +
        "?apikey=" +
        apikey;
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
      return "Null Data";
    }
  }

  Future getCoinDataInLTH(String selectedCurrencyFromSelector) async {
    String coin = "LTH";
    String finalURL = baseURL +
        coin +
        "/" +
        selectedCurrencyFromSelector +
        "?apikey=" +
        apikey;
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
      return "Null Data";
    }
  }
}
