import 'package:flutter/material.dart';
import 'package:novo_projeto/dados/fonte_remota.dart';
import 'package:novo_projeto/dados/modelos/cat_fact.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class FonteRemotaDeCatFact implements FonteRemota<CatFact> {
  final String urlBase = 'catfact.ninja';

  const FonteRemotaDeCatFact();

  @override
  Future<CatFact> get() async {
    var url = Uri.https(urlBase, '/fact');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return CatFact.fromJson(convert.jsonDecode(response.body));
    } else {
      String fato = 'o gato deu errado';
      return Future.value(
        CatFact(
          fact: fato,
          length: fato.length,
        ),
      );
    }
  }

  @override
  Future<List<CatFact>> getLista() async {
    var url = Uri.https(urlBase, '/facts');

    var response = await http.get(url);

    debugPrint(response.toString());

    return Future.value([]);
    // if (response.statusCode == 200) {
    //   return CatFact.fromJson(convert.jsonDecode(response.body));
    // } else {
    //   String fato = 'o gato deu errado';
    //   return Future.value(
    //     CatFact(
    //       fact: fato,
    //       length: fato.length,
    //     ),
    //   );
    // }
  }
}
