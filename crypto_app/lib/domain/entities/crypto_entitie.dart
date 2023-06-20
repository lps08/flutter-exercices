class CryptoEntity {
  int id;
  String name;
  String symbol;
  int cmcRank;
  String convert;
  double price;
  double percentChange1h;
  double percentChange24h;

  CryptoEntity({
    required this.id,
    required this.name,
    required this.symbol,
    required this.cmcRank,
    required this.convert,
    required this.price,
    required this.percentChange1h,
    required this.percentChange24h,
  });

  @override
  String toString() => name;
}
