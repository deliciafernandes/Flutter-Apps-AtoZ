import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:getcoin/utilities/constants.dart';

//class CoinData {
//  Future getData({String currencyType, String cryptType}) async {
//    http.Response response = await http.get(
//      '$apiURL/$cryptType/$currencyType',
//      headers: {'X-CoinAPI-Key': apiKey},
//    );
//
//    //To check api issue run this:
//    //print(response.body);
//
//    if (response.statusCode == 200) {
//      var decodedData = jsonDecode(response.body);
//      var rate = decodedData['rate'];
//
//      return rate.toStringAsFixed(0);
//    } else {
//      print(response.statusCode);
//      throw 'Dels Problem with the get request';
//    }
//  }
//}

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL = '$apiURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
//  Eg: {'BTC':23423, 'ETH':1241241, 'LTC':32523}
    return cryptoPrices;
  }
}
