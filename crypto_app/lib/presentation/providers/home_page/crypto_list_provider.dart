import 'package:crypto_app/domain/entities/crypto_entitie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoListNotifierProvider =
    StateNotifierProvider<CryptoListNotifier, List<CryptoEntity>>(
        (ref) => CryptoListNotifier());

class CryptoListNotifier extends StateNotifier<List<CryptoEntity>> {
  CryptoListNotifier() : super([]);

  void setList(List<CryptoEntity> list) {
    _sort(list);
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

    // sort();
  }

  void _sort(List<CryptoEntity> list) {
    list.sort((a, b) {
      if (a.favorite && !b.favorite) {
        return -1;
      } else if (!a.favorite && b.favorite) {
        return 1;
      } else {
        return 0;
      }
    });
  }
}
