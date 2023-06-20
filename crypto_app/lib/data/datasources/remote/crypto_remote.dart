import 'package:crypto_app/data/datasources/remote/remote.dart';
import 'package:crypto_app/data/models/crypto_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const String baseUrl = 'pro-api.coinmarketcap.com';
const String quotePath = '/v2/cryptocurrency/quotes/latest';
const String listPath = '/v1/cryptocurrency/listings/latest';
const String apiKey = '29a04f6f-5ec4-49c5-8262-95ee845a0dc5';
const String moneyType = 'BRL';
const Map<String, String> headers = {
  'Accepts': 'application/json',
  'X-CMC_PRO_API_KEY': apiKey,
};

class CryptoRemoteDataSources implements RemoteDatasource<CryptoModel> {
  const CryptoRemoteDataSources();
  @override
  Future<CryptoModel> get(String symbol) async {
    Uri url = Uri.https(baseUrl, quotePath, {
      'symbol': symbol,
      'convert': moneyType,
    });

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      String symbol = json['data'].keys.first;
      return CryptoModel.fromJson(json['data'][symbol].first);
    } else {
      return CryptoModel(
        id: -1,
        name: 'Error',
      );
    }
  }

  @override
  Future<List<CryptoModel>> getAll(int limit) async {
    Uri url = Uri.https(baseUrl, listPath, {
      'limit': limit.toString(),
      'convert': moneyType,
    });

    var response = await http.get(url, headers: headers);

    List<CryptoModel> cryptoList = [];
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var listJson = convert.jsonDecode(response.body);
        for (var item in listJson['data']) {
          cryptoList.add(CryptoModel.fromJson(item));
        }
      }
    }
    return cryptoList;
  }
}
