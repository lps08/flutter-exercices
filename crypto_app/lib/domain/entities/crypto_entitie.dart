class CryptoEntity {
  int id;
  String name;
  String symbol;
  int cmcRank;
  String convert;
  double price;
  double percentChange1h;
  double percentChange24h;
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
    bool? favorite,
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
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  String toString() => '$name | $favorite';
}
