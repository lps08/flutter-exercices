import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoListNotifierProvider =
    StateNotifierProvider<CryptoListNotifier, List<CryptoEntity>>(
        (ref) => CryptoListNotifier());

class CryptoListNotifier extends StateNotifier<List<CryptoEntity>> {
  CryptoListNotifier() : super([]);

  void setList(List<CryptoEntity> list) {
    state = list;
  }

  void toggle(CryptoEntity cryptoEntity) {
    state = [
      for (final crypto in state)
        if (crypto.id == cryptoEntity.id)
          crypto.copyWith(favorite: !crypto.favorite)
        else
          crypto
    ];
  }
}
