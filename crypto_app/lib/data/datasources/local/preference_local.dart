import 'dart:convert';
import 'dart:io';

import 'package:crypto_app/data/datasources/local/local.dart';
import 'package:crypto_app/data/models/preference_model.dart';

const String jsonPath =
    '/media/lps/Storage/codes/flutter-exercices/crypto_app/assets/preferences.json';

class PreferenceDataSource implements LocalDataSource<PreferenceModel> {
  final File _file = File(jsonPath);
  @override
  Future<PreferenceModel> get(String symbol) async {
    List<PreferenceModel> list = await _readJsonFile(_file);
    if (list.isNotEmpty) {
      for (var pref in list) {
        if (pref.symbol == symbol) {
          return pref;
        }
      }
    }
    return throw Exception('Preference not found!');
  }

  @override
  Future<List<PreferenceModel>> getAll() async {
    return await _readJsonFile(_file);
  }

  @override
  Future<void> save(PreferenceModel preference) async {
    List<PreferenceModel> listPreferences = await _readJsonFile(_file);

    if (!listPreferences.any((pref) => pref.symbol == preference.symbol)) {
      listPreferences.add(preference);
      _file.writeAsStringSync(json.encode(listPreferences));
    }
  }

  @override
  Future<void> remove(PreferenceModel preference) async {
    List<PreferenceModel> listPreferences = await _readJsonFile(_file);

    if (listPreferences.any((pref) => pref.symbol == preference.symbol)) {
      listPreferences
          .removeWhere((element) => element.symbol == preference.symbol);
      _file.writeAsStringSync(json.encode(listPreferences));
    }
  }

  Future<List<PreferenceModel>> _readJsonFile(File file) async {
    String contents = await file.readAsString();

    if (contents.isNotEmpty) {
      var jsonResponse = jsonDecode(contents);
      List<PreferenceModel> listPreferences = [];

      for (var pref in jsonResponse) {
        listPreferences.add(PreferenceModel.fromJson(pref));
      }
      return listPreferences;
    } else {
      return [];
    }
  }
}
