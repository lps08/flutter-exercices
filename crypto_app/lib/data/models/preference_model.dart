import 'package:isar/isar.dart';
part 'preference_model.g.dart';

@collection
class PreferenceModel {
  Id id = Isar.autoIncrement;
  String? symbol;

  PreferenceModel({this.symbol});

  PreferenceModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['symbol'] = symbol;
    return data;
  }

  @override
  String toString() => symbol!;
}
