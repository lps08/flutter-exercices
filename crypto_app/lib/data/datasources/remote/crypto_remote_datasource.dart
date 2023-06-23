import 'package:crypto_app/data/datasources/remote/remote_datasource.dart';
import 'package:crypto_app/data/models/crypto_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'constants.dart';

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
      throw Exception('Error on fetching data.');
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
    } else {
      throw Exception('Error on fetching data.');
    }
    return cryptoList;
  }
}
