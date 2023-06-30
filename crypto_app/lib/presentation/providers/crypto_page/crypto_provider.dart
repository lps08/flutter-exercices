import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoStateProvider = StateProvider<CryptoEntity>(
  (ref) => CryptoEntity(
    id: -1,
    name: 'none',
    symbol: 'non',
    cmcRank: -1,
    convert: 'BRL',
    price: -1,
    percentChange1h: 0,
    percentChange24h: 0,
    percentChange7d: 0,
    percentChange30d: 0,
    marketCap: 0,
    marketCapDominance: 0,
  ),
);
