class PreferenceModel {
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
