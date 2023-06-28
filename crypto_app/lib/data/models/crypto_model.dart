class CryptoModel {
  int? id;
  String? name;
  String? symbol;
  int? cmcRank;
  Quote? quote;

  CryptoModel({
    this.id,
    this.name,
    this.symbol,
    this.cmcRank,
    this.quote,
  });

  CryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    cmcRank = json['cmc_rank'];
    quote = Quote.fromJson(json['quote']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = {
      symbol: {
        'id': id,
        'name': name,
        'symbol': symbol,
        'cmc_rank': cmcRank,
        'quote': quote!.toJson(),
      },
    };

    return json;
  }

  @override
  String toString() => name!;
}

class Quote {
  String? convert;
  double? price;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? percentChange30d;
  double? marketCap;
  double? marketCapDominance;

  Quote({
    this.convert,
    this.price,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.percentChange30d,
    this.marketCap,
    this.marketCapDominance,
  });

  Quote.fromJson(Map<String, dynamic> json) {
    convert = json.keys.first;
    Map<String, dynamic> jsonData = json[convert];
    price = jsonData['price'];
    percentChange1h = (jsonData['percent_change_1h']).toDouble();
    percentChange24h = (jsonData['percent_change_24h']).toDouble();
    percentChange7d = (jsonData['percent_change_7d']).toDouble();
    percentChange30d = (jsonData['percent_change_30d']).toDouble();
    marketCap = (jsonData['market_cap']).toDouble();
    marketCapDominance = (jsonData['market_cap_dominance']).toDouble();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json[convert!] = {
      'price': price,
      'percent_change_1h': percentChange1h,
      'percent_change_24h': percentChange24h,
      'percent_change_7d': percentChange7d,
      'percent_change_30d': percentChange30d,
      'market_cap': marketCap,
      'market_cap_dominance': marketCapDominance,
    };

    return json;
  }

  @override
  String toString() => price.toString();
}
