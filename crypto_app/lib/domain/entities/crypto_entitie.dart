class CryptoEntity {
  int id;
  String name;
  String symbol;
  int cmcRank;
  String convert;
  double price;
  double percentChange1h;
  double percentChange24h;
  double percentChange7d;
  double percentChange30d;
  double marketCap;
  double marketCapDominance;
  bool favorite;

  CryptoEntity({
    required this.id,
    required this.name,
    required this.symbol,
    required this.cmcRank,
    required this.convert,
    required this.price,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
    required this.marketCap,
    required this.marketCapDominance,
    this.favorite = false,
  });

  CryptoEntity copyWith({
    int? id,
    String? name,
    String? symbol,
    int? cmcRank,
    String? convert,
    double? price,
    double? percentChange1h,
    double? percentChange24h,
    double? percentChange7d,
    double? percentChange30d,
    bool? favorite,
    double? marketCap,
    double? marketCapDominance,
    double? fullyDilutedMarketCap,
  }) {
    return CryptoEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      cmcRank: cmcRank ?? this.cmcRank,
      convert: convert ?? this.convert,
      price: price ?? this.price,
      percentChange1h: percentChange1h ?? this.percentChange1h,
      percentChange24h: percentChange24h ?? this.percentChange24h,
      percentChange7d: percentChange7d ?? this.percentChange7d,
      percentChange30d: percentChange30d ?? this.percentChange30d,
      marketCap: marketCap ?? this.marketCap,
      marketCapDominance: marketCapDominance ?? this.marketCapDominance,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  String toString() => '$name | $favorite';
}
