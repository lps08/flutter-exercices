class CatFact {
  late String fact;
  late int length;

  CatFact({
    required this.fact,
    required this.length,
  });

  CatFact.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fact'] = fact;
    data['length'] = length;
    return data;
  }

  @override
  String toString() => fact;
}
